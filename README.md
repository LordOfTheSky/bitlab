# Bitlab System Admin

### Resumen Ejecutivo

* Descripción

El sistema se encarga de la conexión con la API de Trello dentro de Ruby on Rails.

El sistema permite la creación de una base de datos de usuarios dentro de la empresa donde el usuario administrador puede acceder al sistema y dar de alta a todos sus trabajadores que se encuentren activos dentro de la empresa. 

Al momento de acceder los usuarios contarán con una conexión directa a su Tablero principal de Trello donde se le serán asignados los proyectos que el administrador o jefe de la empresa se los asignara mediante Trello. 

Para funcionar que el administrador pueda dar de alta a los trabajadores, se tiene que tener un grupo empresarial para así poder agregarlos como participantes a cada uno de los proyectos de la empresa. 

La función del sistema en especifico es llevar un control correcto de todos los usuarios activos dentro de la empresa, y permitirles asignarles un proyecto con todas las tareas correspondientes del mismo. 

* Problematica

Se buscaba inicialmente obtener los datos de los proyectos mediante el JSON que Trello genera en cada uno de los tableros y el tablero principal que contiene toda la información plasmada en JSON. 

Se buscaba que el administrador de la empresa pudiera asignar proyectos a los usuarios mediante Trello para que se llevará una administración correcta dentro del sistema de la empresa, saber que proyecto y actividad le toca a cada desarrollador es una ventaja importante. 

La empresa no contaba con una DB de todos los empleados que se encuentran trabajando dentro de ella, y la administración de proyectos se basaba unicamente en Trello, pero muchos de los empleados no utilizaban la plataforma para su correcto desarrollo y se perdía tiempo en el desarrollo de cada aplicación.

* Solución

Al momento de realizar las conexiónes con los Links generados por Trello con el contenido del JSON, fue difícil dado que era una gran cantidad de información y se tenía que acceder a claves especificas dentro de estos archivos. 

Se encontro una Gem Trello que permite la conexión e interacción con la API que nos permite acceder a nuestras cuentas mediante los Key de desarrollo, podemos acceder a los boards, list y cards asignados a nuestro usuario. 

El uso de la Gem facilito la obtención de datos dado que se manejo solamente mediante un ciclo de recorrido donde mostraba especificamente el contenido de boards, según la cantidad de boards que el usuario tenía asignados dentro del sistema. 

* Arquitectura

![fase 3](https://cloud.githubusercontent.com/assets/16099685/25505915/9f926b44-2b69-11e7-8494-6d14120a981d.png)


### Requerimientos

### Instalación

### Configuración

### Uso

### Contribución

### Roadmap
