/* Crear tablas */
CREATE TABLE "public"."fact_delitos" (
	"id" SERIAL PRIMARY KEY,
	"id_tiempo" INT NOT NULL,
	"id_tipo" INT NOT NULL,
	"id_subtipo" INT NOT NULL,
	"id_ubicacion" INT NOT NULL,
	"ds_uso_arma" VARCHAR(2) NOT NULL,
	"ds_uso_moto" VARCHAR(2) NOT NULL,
	"cantidad" INT NOT NULL
);

CREATE TABLE "public"."dim_tiempo" (
	"id" SERIAL PRIMARY KEY,
	"anio" INT NOT NULL,
	"id_mes" INT NOT NULL,
	"ds_mes" VARCHAR(50) NOT NULL,
	"id_dia_semana" INT NOT NULL,
	"ds_dia_semana" VARCHAR(50) NOT NULL,
	"dia_mes" INT NOT NULL,
	"horario" INT NOT NULL
);

CREATE TABLE "public"."dim_tipo" (
	"id_tipo" SERIAL PRIMARY KEY,
	"ds_tipo" VARCHAR(50) NOT NULL
);

CREATE TABLE "public"."dim_subtipo" (
	"id_subtipo" SERIAL PRIMARY KEY,
	"ds_subtipo" VARCHAR(50) NOT NULL
);

CREATE TABLE "public"."dim_ubicacion" (
	"id_ubicacion" SERIAL PRIMARY KEY,
	"ds_barrio" VARCHAR(100) NOT NULL,
	"ds_ciudad_barrio" VARCHAR(100) NOT NULL,
	"id_comuna" INT NOT NULL,
	"ds_comuna" VARCHAR(100) NOT NULL
);

/* Establecer relaciones entre la Fact y las dimensiones*/
ALTER TABLE "public"."fact_delitos"
ADD CONSTRAINT fk_fact_delitos_id_tiempo
FOREIGN KEY ("id_tiempo") REFERENCES "public"."dim_tiempo" ("id");

ALTER TABLE "public"."fact_delitos"
ADD CONSTRAINT fk_fact_delitos_id_tipo
FOREIGN KEY ("id_tipo") REFERENCES "public"."dim_tipo" ("id_tipo");

ALTER TABLE "public"."fact_delitos"
ADD CONSTRAINT fk_fact_delitos_id_subtipo
FOREIGN KEY ("id_subtipo") REFERENCES "public"."dim_subtipo" ("id_subtipo");

ALTER TABLE "public"."fact_delitos"
ADD CONSTRAINT fk_fact_delitos_id_ubicacion
FOREIGN KEY ("id_ubicacion") REFERENCES "public"."dim_ubicacion" ("id_ubicacion");

