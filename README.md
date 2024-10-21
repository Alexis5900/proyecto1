## PROYECTO 1: Algoritmo de Sistema de Costos
## Descripción del algoritmo

Este algoritmo simula un sistema para calcular el costo total de un producto basado en su precio original, cantidad comprada, descuentos aplicables, impuestos, y costo de envío, cumpliendo los siguientes pasos:

1. **Lectura y validación de datos**:
   - **Nombre del producto**: Se solicita al usuario que ingrese el nombre del producto, el cual es validado para que tenga al menos un carácter.
   - **Precio original**: Se pide al usuario que ingrese el precio del producto. El algoritmo valida que solo se ingresen números y que el precio sea mayor a cero.
   - **Cantidad de productos**: El usuario indica cuántos productos desea comprar, y si la cantidad es mayor a uno, se aplica un descuento del 5%.
   - **Opción de envío**: Se solicita al usuario que seleccione una opción de envío (1 si es dentro de la región o 2 si es fuera de la región), asignando un costo de $5,000 CLP o $9,000 CLP respectivamente.
   - **Peso del producto**: El usuario ingresa el peso del producto en kilogramos, siendo validado para que sea igual o mayor a 0.1 kg.
   - **Cupón de descuento**: Se pregunta si el usuario posee un cupón de descuento, y si es así, se aplica un 10% de descuento sobre el precio original.

2. **Cálculos**:
   - **Aplicación del cupón de descuento**: Si el cliente tiene un cupón, se aplica el porcentaje de descuento al precio original.
   - **Aplicación de IVA**: Al precio con descuento, se le suma un impuesto del 12% (IVA).
   - **Descuento por cantidad**: Si el cliente compra más de un artículo, se aplica un descuento adicional del 5%.
   - **Costo de envío**: El costo de envío se calcula sumando un valor fijo de $1,000 CLP al costo variable de envío basado en la opción seleccionada (dentro o fuera de la región) multiplicado por el peso del producto.

3. **Cálculo final**:
   - El costo total del producto se obtiene sumando el precio con descuentos e impuestos multiplicado por la cantidad de productos, más el costo de envío calculado.

4. **Desglose de precios**:
   - El algoritmo almacena en un arreglo el desglose de los componentes del precio final, mostrando el nombre del producto, el precio original, el precio con descuento, el precio con IVA, el precio con descuento por cantidad, el costo de envío y el costo final a pagar.
