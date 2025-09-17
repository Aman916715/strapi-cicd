export default ({ env }: { env: any }) => ({
  host: '0.0.0.0',
  port: env.int('PORT', 1337),
  url: env('APP_URL', 'http://localhost'),
  app: {
    keys: env.array('APP_KEYS'),
  },
  proxy: true,
});
