require('dotenv').config();

const app_config = {
    port: process.env.PORT || "5000",
    enable_request_timeout: process.env.ENABLE_REQUEST_TIMEOUT || true,
    mongouri: process.env.MONGOURI || "mongodb://127.0.0.1:27017/exprenses-express",
    jwt: {
        expiry: process.env.JWT_EXPIRY || "1h",
        secret: process.env.JWT_SECRET || "adafef837393",
    },
};

module.exports = app_config;    