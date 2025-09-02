package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/go-chi/chi/v5"
	"github.com/rs/zerolog"
)

func main() {

	var logger zerolog.Logger
	output := zerolog.ConsoleWriter{ //nolint:exhaustruct
		Out:        os.Stdout,
		TimeFormat: "2006-01-02T15:04:05.000Z07:00",
	}
	logger = zerolog.New(output).With().Timestamp().Logger()

	logger.Info().Msg("Starting Basic Go Server on host 0.0.0.0 and port 8000")

	router := chi.NewRouter()
	router.Get("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("OK"))
	})

	server := &http.Server{
		Addr:                         fmt.Sprintf("%s:%s", "0.0.0.0", "8000"),
		Handler:                      router,
		ReadHeaderTimeout:            5 * time.Second,
		ReadTimeout:                  10 * time.Second,
		WriteTimeout:                 10 * time.Second,
		IdleTimeout:                  10 * time.Second,
		MaxHeaderBytes:               1 * 1024 * 1024,
		DisableGeneralOptionsHandler: false,
		TLSConfig:                    nil,
		TLSNextProto:                 nil,
		ConnState:                    nil,
		ErrorLog:                     log.New(os.Stderr, "", log.LstdFlags),
		BaseContext:                  nil,
		ConnContext:                  nil,
		HTTP2:                        nil,
		Protocols:                    nil,
	}

	server.ListenAndServe()
}
