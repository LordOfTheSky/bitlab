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

* Servidores, Web, Base de Datos

Github 

Bitlab Server 

Postgresql

Heroku 

Trello Account 

* Paquetes adicionales

Al crear Proyecto en Ruby o clonar el repositorio en el archivo Gemfile se tienen que agregar las siguientes dependencias para su correcto uso 

```Ruby
gem 'jquery-rails'

gem 'jsonapi-parser', '~> 0.1.1.beta2'
gem 'jquery-ui-rails'
gem 'rails-i18n', '~> 5.0.0'
gem 'httparty', '~> 0.13.5'
gem 'bootstrap', '~> 4.0.0.alpha4'
gem 'ruby-trello', '~> 1.5', '>= 1.5.1'
gem 'bootstrap-admin', git: 'https://BLRGR:guad.rm1@bitbucket.org/bitlabmx/bootstrapadmin.git'
gem 'inheritance', git: 'https://BLRGR:guad.rm1@bitbucket.org/bitlabmx/inheritanceresources.git',  branch: 'FL_add_generators'
gem 'jsonapi'
gem 'turbolinks', '~> 5'
```
* Versión de Ruby and Rails

```Ruby
Se declara mediante linea de comandos al momento de instalarlo

ruby 2.3.1p112

Se declara en el Gemfile del archivo creado en Ruby 

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
```

### Instalación

* Instalar ambiente de desarrollo

Open Terminal and run the following command:

`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Now that we have Homebrew installed, we can use it to install Ruby.

We're going to use rbenv to install and manage our Ruby versions.

To do this, run the following commands in your Terminal:

`brew install rbenv ruby-build`

Add rbenv to bash so that it loads every time you open a terminal

`echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile`

`source ~/.bash_profile`

Install Ruby

`rbenv install 2.4.0`

`rbenv global 2.4.0`

`ruby -v`

Replace the example name and email address in the following steps with the ones you used for your Github account.

`git config --global color.ui true`

`git config --global user.name "YOUR NAME"`

`git config --global user.email "YOUR@EMAIL.com"`

`ssh-keygen -t rsa -C "YOUR@EMAIL.com"`

The next step is to take the newly generated SSH key and add it to your Github account. You want to copy and paste the output of the following command and paste it here.

`cat ~/.ssh/id_rsa.pub`

Once you've done this, you can check and see if it worked:

`ssh -T git@github.com`

You should get a message like this:

`Hi excid3! You've successfully authenticated, but GitHub does not provide shell access.`

Installing Rails is as simple as running the following command in your Terminal:

`gem install rails -v 5.0.1`

Rails is now installed, but in order for us to use the rails executable, we need to tell rbenv to see it:

`rbenv rehash`

And now we can verify Rails is installed:

`rails -v`

`Rails 5.0.1`

You can install PostgreSQL server and client from Homebrew:

`brew install postgresql`

Once this command is finished, it gives you a couple commands to run. Follow the instructions and run them:

To have launchd start postgresql at login:

`ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents`

Then to load postgresql now:

`launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

 And now for the moment of truth. Let's create your first Rails application:

`rails new myapp`

 If you want to use Postgres

 Note you will need to change config/database.yml's username to be

 the same as your OSX user account. (for example, mine is 'chris')

`rails new myapp -d postgresql`

 Move into the application directory

`cd myapp`

 If you setup MySQL or Postgres with a username/password, modify the

 config/database.yml file to contain the username/password that you specified

 Create the database

`rake db:create`

`rails server`

* Ejecutar pruebas manualmente

Mediante la carpeta Test se modifican las pruebas para controllador y modelos

* Producción en ambiente local 

In command line

Create new Folder

`cd Documents/new-folder/`

`git clone https://github.com/LordOfTheSky/bitlab.git`

`rails server`

### Configuración

* Archivos de configuración

En el desarrollo de la aplicación se deben de configurar diferentes archivos según el usuario que se encuentre accediendo al sistema, dado que cada computadora tiene por ejemplo, diferente User y Pass para acceder a DB

-DATABASE.YML

```Ruby
Default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: localhost
  username: #username
  password: #password


development:
  <<: *default
  database: #namedatabase
```

-APPLICATION.RB

Se agregan los requerimientos de las gemas que se van a utilizar dentro de la aplicación, junto con la internacionalicación mediante i18n estableciendo el lenguaje local como `:es`

```Ruby
require 'rails/all'
require 'httparty'
require 'trello'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BitlabAdmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :es


    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
```

-INITIALIZERS/TRELLO.RB

Se agregan las llaves del usuario que va a utilizar el sistema de Trello

```Ruby
Trello.configure do |config|
	config.developer_public_key = '#yourpublickey'
	config.member_token = '#yourmembertoken'
end
```
* Configuración de los requerimientos

### Uso

* Manual para usuarios finales

* Referencia usuario administrador

### Contribución

* Contribución para usuarios

* Pasos para aportar

### Roadmap

* Requerimientos futuros
