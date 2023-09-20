package handlers

import (
	"encoding/json"
	"net/http"
	"pi/cmd/internal/api/v1/repositories"

	"github.com/gorilla/mux"
)

func GetWarning(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	war, err := repositories.GetWarning(id)

	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	} else {
		w.Header().Add("Content-Type", "application/json")
		json.NewEncoder(w).Encode(war)
	}
}
