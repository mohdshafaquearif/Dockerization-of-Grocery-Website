# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the HTML and other website files to the Nginx server directory
COPY . /usr/share/nginx/html

# Expose port 80 for serving the website
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
