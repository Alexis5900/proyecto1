Proceso proyecto
	
//##########################################################################################################################################
//############################ Los primeros 6 pasos de Output e Input respectivamente son para obtener y validar información ingresada #####
//##########################################################################################################################################
		
// 1.- Solicita ingresar nombre producto
	Definir nombreProducto Como Caracter;
	
	Repetir
		Escribir "Ingrese nombre producto:";
		Leer nombreProducto;
		nombreProducto <- MAYUSCULAS(nombreProducto);
		Si Longitud(nombreProducto) <= 0 Entonces
			Escribir "Debe ingresar nombre de producto, de al menos un carácter:";
		FinSi
	Hasta Que Longitud(nombreProducto) > 0; 
	
	Definir esValido Como Logico;//Para validar Ingreso sólo de números
// 2.- Solicita ingresar precio producto, solo números del 0 al 9
    Definir precioOriginalTexto Como Caracter;
    Definir precioOriginal Como Real;
	
	Repetir
        Escribir "Ingrese precio producto (solo números):";
        Leer precioOriginalTexto;
        esValido <- ValidarSoloNumeros(precioOriginalTexto);
        Si esValido Entonces
            precioOriginal <- ConvertirANumero(precioOriginalTexto);
            Si precioOriginal <= 0 Entonces
                Escribir "Debe ingresar un precio mayor a 0:";
            FinSi
        SiNo
            Escribir "Debe ingresar solo números.";
        FinSi
    Hasta Que esValido Y precioOriginal > 0;
	
// 3.- Solicita ingresar cantidad de productos
	Definir cantidadProductosTexto Como Caracter;
	Definir cantidadProductos Como Entero;
	
	Repetir
		Escribir "Ingrese cantidad de producto(s) que desea comprar, si su compra es de dos o más productos obtendrá un descuento del 5%;";
		Leer cantidadProductosTexto;
		esValido <- ValidarSoloNumeros(cantidadProductosTexto);
		Si esValido Entonces
			cantidadProductos <- ConvertirANumero(cantidadProductosTexto);
			Si cantidadProductos <= 0 Entonces
				Escribir "Debe ingresar una cantidad mayor a 0.";
			FinSi
		SiNo
			Escribir "Debe ingresar solo números.";
		FinSi
	Hasta Que esValido Y cantidadProductos > 0;
	
	// Aplicar descuento por cantidad
	Definir cantidadDescuentoPorcentaje Como Real;
	Si cantidadProductos > 1 Entonces
		cantidadDescuentoPorcentaje <- 5;
	SiNo
		cantidadDescuentoPorcentaje <- 0;
	FinSi
	
// 4.- Solicita ingresar opción de envío
	Definir opcionEnvioTexto Como Caracter;
	Definir opcionEnvio Como Entero;
	
	Repetir
		Escribir "Ingrese opción de envío, presione 1 si es misma región, valor 5.000 CLP, o 2 si es fuera de región, valor 9.000 CLP:";
		Leer opcionEnvioTexto;
		esValido <- ValidarSoloNumeros(opcionEnvioTexto);
		Si esValido Entonces
			opcionEnvio <- ConvertirANumero(opcionEnvioTexto);
			Si No(opcionEnvio = 1 O opcionEnvio = 2) Entonces
				Escribir "Debe ingresar sólo opción 1 o 2.";
			FinSi
		SiNo
			Escribir "Debe ingresar solo números.";
		FinSi
	Hasta Que esValido Y (opcionEnvio = 1 O opcionEnvio = 2);
	
	// Asignar valor de envío según opción seleccionada
	Definir valorEnvio Como Real;
	Si opcionEnvio = 1 Entonces
		valorEnvio <- 5000;
	SiNo
		valorEnvio <- 9000;
	FinSi
	
// 5.- Solicita ingresar peso del producto
	Definir pesoProductoTexto Como Caracter;
	Definir pesoProducto Como Real;

	Repetir
		Escribir "Ingrese peso (KG) del producto, ingrese 0.1 o superior:";
		Leer pesoProductoTexto;
		esValido <- ValidarSoloNumeros(pesoProductoTexto);
		Si esValido Entonces
			pesoProducto <- ConvertirANumero(pesoProductoTexto);
			Si pesoProducto < 0.1 Entonces
				Escribir "Debe ingresar un peso válido mayor a 0.1 KG.";
			FinSi
		SiNo
			Escribir "Debe ingresar solo números.";
		FinSi
	Hasta Que esValido Y pesoProducto >= 0.1;
	
// 6.- Solicita indicar si posee cupón de descuento
	Definir indicadorCuponDescuento Como Caracter;
	Repetir
		Escribir "Indique si posee cupón de descuento (S/N):";
		Leer indicadorCuponDescuento;
		indicadorCuponDescuento <- MAYUSCULAS(indicadorCuponDescuento);
		Si No(indicadorCuponDescuento = 'S' O indicadorCuponDescuento = 'N') Entonces
			Escribir "Para indicar cupón sólo ingrese S o N.";
		FinSi
	Hasta Que (indicadorCuponDescuento = 'S' O indicadorCuponDescuento = 'N');
	
	Definir cuponDescuentoPorcentaje Como Real;
	Si indicadorCuponDescuento = 'S' Entonces
		cuponDescuentoPorcentaje <- 10;
	SiNo
		cuponDescuentoPorcentaje <- 0;
	FinSi
	
//##########################################################################################################################################
//############################ Cálculos ####################################################################################################
//##########################################################################################################################################
	
// 1.- Precio con cupón de descuento
	Definir precioConCuponDescuento Como Real;
	precioConCuponDescuento <- precioOriginal * (1 - cuponDescuentoPorcentaje/100);
	
// 2.- Precio con IVA
	Definir precioConIva Como Real;
	Definir IVA_PORCENTAJE Como Real;
	IVA_PORCENTAJE <- 12;
	precioConIva <- precioConCuponDescuento * (1 + IVA_PORCENTAJE/100);
	
// 3.- Precio con descuento por cantidad
	Definir precioConDescuentoCantidad Como Real;
	precioConDescuentoCantidad <- precioConIva * (1 - cantidadDescuentoPorcentaje/100);
	
// 4.- Costo de envío
	Definir costoEnvio Como Real;
	Definir COSTO_ENVIO_VALOR_FIJO Como Real;
	COSTO_ENVIO_VALOR_FIJO <- 1000;
	costoEnvio <- COSTO_ENVIO_VALOR_FIJO + (valorEnvio * pesoProducto);
	
// 5.- Costo final
	Definir costoFinalProducto Como Real;
	costoFinalProducto <- (precioConDescuentoCantidad * cantidadProductos) + costoEnvio;
	
// Arreglo para almacenar el desglose
    Definir arregloLista Como Caracter;
    Dimension arregloLista[7,2];
	
    arregloLista[0,0] <- "Nombre del producto:";
    arregloLista[0,1] <- nombreProducto;
	
    arregloLista[1,0] <- "Precio original:";
    arregloLista[1,1] <- ConvertirATexto(precioOriginal);
	
    arregloLista[2,0] <- "Precio con cupón de descuento:";
    arregloLista[2,1] <- ConvertirATexto(precioConCuponDescuento);
	
    arregloLista[3,0] <- "Precio con IVA:";
    arregloLista[3,1] <- ConvertirATexto(precioConIva);
	
    arregloLista[4,0] <- "Precio con descuento por cantidad:";
    arregloLista[4,1] <- ConvertirATexto(precioConDescuentoCantidad);
	
    arregloLista[5,0] <- "Costo de envío:";
    arregloLista[5,1] <- ConvertirATexto(costoEnvio);
	
    arregloLista[6,0] <- "Costo final a pagar:";
    arregloLista[6,1] <- ConvertirATexto(costoFinalProducto);
	
	mostrarDesglose(arregloLista);
	
FinProceso

// Función para mostrar desglose 
Funcion mostrarDesglose(arregloLista)
	
	Definir i Como Entero;
	Para i<-0 Hasta 6 Con Paso 1 Hacer
		Escribir arregloLista[i,0], " ", arregloLista[i,1];
	FinPara
	
FinFuncion

// Función para validar si la cadena contiene sólo números del 0 al 9
Funcion esValido <- validarSoloNumeros(soloNumero)
    Definir i Como Entero;
	Definir contadorErrores Como Entero;
	Definir esValido Como Logico;
	
    contadorErrores <- 0;

    Para i <- 0 Hasta Longitud(soloNumero)-1 Con Paso 1 Hacer
		Si No (Subcadena(soloNumero, i, i) >= "0" Y Subcadena(soloNumero, i, i) <= "9") Entonces
            contadorErrores <- contadorErrores + 1;
        FinSi
    FinPara
	
    Si contadorErrores > 0 Entonces
        esValido <- Falso;
    SiNo
        esValido <- Verdadero;
    FinSi
	
FinFuncion

