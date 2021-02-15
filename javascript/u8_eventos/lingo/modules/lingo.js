// Recibe los valores de las entradas, los junta y devuelve en una cadena.
function hacerPalabra(entradas){
    let pal = "";
    for(let aux=0; aux<entradas.length-1; aux++)
        pal += entradas[aux].value;
    return pal;
}
/* Recibe la palabra del usuario y la palabra clave, las compara 
 * letra por letra y devuelve un array con colores para cada letra.
 */
function comprobarLetras(pal, palClave){
    let letraS = pal.split("");
    let claveS = palClave.split("");
    let coloreS = [];

    for(let aux=0; aux<5; aux++){
        if(claveS.indexOf(letraS[aux])>=0)
            letraS[aux]==claveS[aux] ? coloreS.push("verde") : coloreS.push("amarillo");
        else
            coloreS.push("rojo");
    }
    return coloreS;
}
/* Recibe una palabra y un array con una serie de colores,
 * crea una fila en la pantalla con las letras junto a su color.
 */
function crearFila(pal, coloreS){
    let letraS = pal.split("");
    let div = document.createElement("div");
    div.classList.add("fila");
    for(let aux=0; aux<=4; aux++){
        div.innerHTML += `<div class='letra ${coloreS[aux]}'>${letraS[aux]}</div>`;
    }
    document.getElementById("contenedor").appendChild(div);
}
export{hacerPalabra,comprobarLetras,crearFila};