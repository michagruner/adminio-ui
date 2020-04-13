export const environment = {
  production: window["env"]["adminioProd"] || false,
  apiBaseUrl: window["env"]["apiUrl"] || "default"
};
