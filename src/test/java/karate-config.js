function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    var config = {
        env: env,
        baseUrl: 'https://petstore.swagger.io/v2'
    };

    // Set default headers
    karate.configure('headers', { 'Content-Type': 'application/json', 'Accept': 'application/json' });

    return config;
}
