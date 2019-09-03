practica13App
Balanceadores de Carga y Contenedores de Aplicaciones. 


Objetivos: 
• Implementar un sistema distribuido para las sesiones web en más de un servidor.
• Implementar un balanceador de carga con el algoritmo round robin con tolerancia a fallo.
• Implementar contenedores de aplicaciones en una solución informática.
Desarrollo de la práctica. Los estudiantes en grupo de 2, realizaran lo requerido en el desarrollo de la práctica.
 
 
 Pasos para correr con Docker:
 # cd  practica13app 
 # Docker swarm init
 # docker stack deploy -c docker-compose.yml pollapp

