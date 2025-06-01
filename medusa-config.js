// medusa-config.js

const dotenv = require("dotenv");
dotenv.config();

module.exports = {
  projectConfig: {
    jwtSecret: process.env.JWT_SECRET || "some-secret-key",
    cookieSecret: process.env.COOKIE_SECRET || "some-cookie-secret",
    database_url: process.env.DATABASE_URL || "postgres://user:password@dbhost:5432/medusa",
    database_type: "postgres",
    store_cors: process.env.STORE_CORS || "http://localhost:8000",
    admin_cors: process.env.ADMIN_CORS || "http://localhost:7000",
  },
  plugins: [],
};
