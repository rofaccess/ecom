# ecom
## Prerequisitos de instalación
- Postgresql 9.6 (No se comprobó con otra base de datos)
- rvm
- Ruby 1.9.3

## Instalación
Clonar el repositorio
> git clone https://github.com/rofaccess/ecom.git

Ingresar a la carpeta
> cd ecom

Si no se configuró por defecto el gemset al ingresar a la carpeta, ejecutar
> rvm use 1.9.3

> rvm gemset create ecom

> rvm gemset use ecom

Instalar bundler
> gem install bundler --version 1.16.6

Instalar las gemas
> bundle install

Ejecutar los tests
> bundle exec rspec

Ejecutar los seeds
> rake db:seed

Ejecutar la aplicación
> rail s

Acceder a: http://localhost:3000/api/sale_orders en el navegador o
en consola:
> curl -w '\n' http://localhost:3000/api/sale_orders

## Logros
No pude lograr los requisitos principales del Desafío. Aún así voy a listar algunas cosas hice:
- Planifiqué y redacté los tickets en Github. Cuando me dí cuenta que no terminaría a tiempo, rehice mi planificación. En la pestaña projects se puede apreciar más ordenado el proceso de uno de los dos milestones que planifiqué.
- Diseñe un modelo de datos y fui actualizándolo a medida que fui desarrollando. Las versiones de los modelos se encuentran en docs/
- En el diseño del modelo de datos tuve en cuenta el uso de clave foranea, index y constraints para asegurar la integridad de los datos.
- Utilicé la gema rails-api para evitar heredar los controladores de los APIs de ActionController según se recomienda para que la aplicación sea mas ligera.
- Utilicé la gema simplecov para llevar un seguimiento de la cobertura de código. Después de ejecutar los tests, se puede apreciar el resultado de la cobertura abriendo el archivo coverage/index.html en un navegador.
- Estructuré las carpetas de tal modo a permitir versionar las APIs. 
- Se configuró la ruta para usar /api/sale_orders y acceder directamente a la API v1 por defecto. Si hubiera otra versión, se puede indicar la versíon en el Header de la petición.
- Usé la gema json-schema para validar de manera más sencilla el json devuelto por las APIs en los specs. Los schema están en spec/support/api/schemas/
- Usé la gema rubocop para mantener un buen estandar de código (en las ultimas estando apurado dejé de verificar esto, así que existen advertencias al ejecutar rubocop). La configuración de rubocop está en .rubocop.yml
- Usé la gema active_model_serializers para serializar los datos devueltos por las APIs y mantener centralizado allí la especificación de los atributos devueltos.
- Utilicé la gema activerecord-import para implementar los seeds. Esta gema permite inicializar los datos de prueba rapidamente y aprovechar los constraint para lidiar con conflictos y poder ejecutar los seed varias veces sin que causen problemas. Lastimosamente no pude llegar a implementar las APIs que tendrían que lidiar con gran cantidad de datos, por lo que no aproveché todo su potencial.
