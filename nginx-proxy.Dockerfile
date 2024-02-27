# Use the official Nginx image as the base
FROM nginx:alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/nginx.conf.template

# Use `envsubst` to replace the placeholder with the actual API_KEY environment variable
CMD ["/bin/sh", "-c", "envsubst '$$API_KEY' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
