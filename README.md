# Universal Pattern Microservice Example

Se propone desarrollar una red social de fanáticos de autos.
El sistema permitirá buscar autos por marca, y que cada usuario pueda hacer una review de los autos encontrados.

Esa review quedará en el feed del usuario que la realiza.

Los usuarios de la red social podrán dejar comentarios sobre las reviews realizadas, como así tambien like.

# Como ejecutar el ejemplo sin Docker?

Antes de ejecutar el ejemplo es necesario contar con Node.js v18 o superior y MongoDB 6 o superior.

Si es necesario, puede editar el archivo `server.sh` para cambiar la configuración del acceso a la base de datos, puerto, etc.

```bash
$ git clone https://github.com/lortmorris/universal-pattern-example.git
$ cd universal-pattern-example
$ npm install
$ node --env-file=.env index.js
```

Ahora podemos abrir nuestro navegador y ver la [documentación de los endpoints](http://localhost:3500/services/docs)


# Ejecutando con Docker
Para ejecutar el ejemplo via docker, requerimos contar con Docker instalado.
Al ejecutar `docker compose up` los creará dos contenedores, uno con MongoDB y otro con el microservicio.

```bash
$ sudo docker compose up
```


# Modulos definidos

Recordemos que [Universal Pattern](https://www.npmjs.com/package/universal-pattern) tiene como objetivo acelerar el desarrollo, ofreciendo la posibilidad de escribir endpoints desde un archivo yaml (swagger).


## Users
El módulo de usuarios tiene algunos detalles importantes:
- Permite login y retorna un jwt.
- Cuando se ejecute el ejemplo por primera vez, se creará un usuario nivel 50 (el administrador):
  - mail@example.com / SET_PASSWORD
- Algunos endpoints requieren auth, es decir, que el usuario esté autentificado.
- Algunos endpoints requieren nivel 50 (admin).


## Brands
Son las marcas de autos.
Se deberá tener las marcas de los autos en una collection.

Sólo un usuario nivel 50 puede crear marcas.

## Cars
Es el módulo que trabaja con los autos en si.
Para insert un nuevo `car` debemos tener en consideración:

- Los colores disponibles están en un enum, por lo cual si pasamo un color que no esté en la lista, UP retornará un error.
- El `brandId` debe ser un id válido de MongoDB, y existir en la collection `brand`

# Autocannon
```bash
$ npm install autocannon -g
$ autoannon "http://localhost:3500/services/users?limit=1&page=1"
```
