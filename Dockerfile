FROM golang:1.22.0 as build-stage
WORKDIR /build
COPY go.mod .
RUN go mod tidy
COPY . .

RUN go build main.go && chmod u+x main

# Depuis une image minimale alpine. 
FROM alpine

# Crée le dossier /app et place toutes les instructions suivantes dans /app
WORKDIR /app

# Copie le fichier exécutable main provenant de l'image temporaire dans le dossier courant
COPY --from=build-stage /build/main ./

# Lance l'exécutable main au runtime du conteneur
CMD ["./main"]