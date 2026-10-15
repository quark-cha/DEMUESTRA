# Transporte de la coordenada transversal

Se amplian las derivaciones parciales de P_VR_rho sin modificar el Markdown.

## Resultado formalizado

Para puntos del dominio declarado de U_VED, se deduce:

```latex
\forall x\in U_{\rm VED}^{\rho},\quad
\rho_{\rm VED}(x)=|\Re(f(x))-1/2|.
```

Para puntos del dominio declarado de U_Rim, se deduce:

```latex
\forall z\in U_{\rm Rim}^{\rho},\quad
\rho_{\rm VED}(f^{-1}(z))=|\Re(z)-1/2|.
```

Estas deducciones emplean la conservacion de coordenadas expresada en P_RHO_ISO y la definicion previa de rho_R. Las pruebas generadas conservan sus hipotesis de dependencia explicitas; no son una prueba incondicional de la existencia del isomorfismo ni de la hipotesis de Riemann.

## Alcance pendiente

La conclusion abreviada rho_VED = rho_R = |a-1/2| sigue pendiente en el generador: los campos escalares rho_VED, rho_R y a no estan todavia vinculados al mismo punto de los mapas en esa representacion. No se presupone dicha igualdad, no se introduce un axioma para cerrarla y no se modifica el estado de la afirmacion principal como si estuviera resuelta.

Los informes generados incluyen las dos nuevas derivaciones en partial_theorems con alcance CORRESPONDING_POINTS_IN_DECLARED_DOMAINS. Una prueba negativa comprueba que no se generan si no esta disponible la dependencia de conservacion de coordenadas.

Las 19 pruebas de estabilidad y las 54 pruebas del traductor pasan. Las copias de formal_lean_backend.py en DEMUESTRA y PUBLICAR coinciden. La comprobacion nativa utiliza el archivo generado tests/.tmp_publicacion/transporte_punto_a_punto_generado.lean, sin sustituir los certificados ni los informes de produccion.

La comprobacion nativa finalizo con codigo 0: compilan los 34 teoremas del archivo generado. La consulta de axiomas de las dos nuevas derivaciones muestra solamente propext, Classical.choice y Quot.sound; no aparece sorryAx ni un axioma adicional para imponer la conclusion. Esto no elimina sus hipotesis de dependencia ni cambia el estado pendiente de la igualdad escalar abreviada.
