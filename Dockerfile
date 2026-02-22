FROM node:20-alpine

WORKDIR /app

# 1) Dependencies aus src installieren (weil package.json in src liegt)
COPY src/package*.json ./
RUN npm ci --only=production

# 2) Restlichen src-Code rüberkopieren
COPY src/ ./

# Falls deine API auf einem anderen Port läuft: anpassen
EXPOSE 3001

# Start (weil index.js in src/ liegt und wir src/ nach /app kopiert haben)
CMD ["npm", "start"]