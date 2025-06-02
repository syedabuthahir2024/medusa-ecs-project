// medusa-config.js

const dotenv = require("dotenv");
dotenv.config();

// Helper to ensure required env vars are set
function getEnv(name, fallback = null, required = false) {
  const value = process.env[name] || fallback;
  if (required && !value) {
    throw new Error(`Missing required environment variable: ${name}`);
  }
  return value;
}

module.exports = {
  projectConfig: {
    jwtSecret: getEnv("JWT_SECRET", "some-secret-key", true),        // Required in production
    cookieSecret: getEnv("COOKIE_SECRET", "some-cookie-secret", true),// Required in production
    database_url: getEnv("DATABASE_URL", "postgres://user:password@dbhost:5432/medusa", true),
    database_type: "postgres",
    store_cors: getEnv("STORE_CORS", "http://localhost:8000"),
    admin_cors: getEnv("ADMIN_CORS", "http://localhost:7000"),

    // Optional Redis URL for caching/sessions
    redis_url: getEnv("REDIS_URL", null, false),
  },

  plugins: [
    // Example: Redis cache plugin, uncomment if using Redis caching
    // {
    //   resolve: `medusa-redis-cache`,
    //   options: {
    //     url: getEnv("REDIS_URL", "redis://localhost:6379"),
    //   },
    // },
    // Add other plugins here
  ],
};
