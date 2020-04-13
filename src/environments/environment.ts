export const environment = {
  production: window["env"]["adminioProd"] || false,
  apiBaseUrl: window["env"]["apiUrl"] || "http://localhost:8080"
};
