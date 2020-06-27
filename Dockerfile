#Contoh Dockerfile
#Dockerfile pada direktori ini akan di build pada proses pipeline
#Berikut adalah contoh sederhana dari Dockerfile yang memodifikasi existing image dengan source code terbaru
#================================================================
#   FROM <nama_image> | menentukan base image yang diinginkan
#   WORKDIR <path> | menentukan default direktori dari container
#   COPY <host_path> <container_path> | melakukan salin source code dari host ke container
#   EXPOSE 80 443 | menunjukan image dapat diakses melalui port 80 443
#================================================================
#https://docs.docker.com/engine/reference/builder/


