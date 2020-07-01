function FindWords()
{
  //recupero el string que acabo de ingresar
  var str= document.getElementById("text1").value;
  //lo reseeteo para que se pueda ingresar otro
  document.getElementById("text1").value= '';
  //genero objeto js
  var texto= {palabras: str}
  // llamo a la view que revisa los palindromos y le paso el texto
  fetch('http://localhost:9292/hola', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body: JSON.stringify(texto),
  
  }).then(response => response.json()).then(
    function foo(respuestaConJson)
    {
      // Muestro la cantidad de palabras
      

      document.getElementById("numeroPalabras").innerHTML =  "Cantidad de palabras mágicas detectadas: " +  respuestaConJson.findMugglesWords.length ;
        // Genero string con todas las palabras Magicas encontradas
        palabrasPalindromos=" ";
        for ( var i in respuestaConJson.findMugglesWords)
        {
          palabrasPalindromos += respuestaConJson.findMugglesWords[i] + " | " ;
        }
        if (palabrasPalindromos == " "){
          document.getElementById("PalabrasMagicas").innerHTML =  " ";
        }
        else {
        document.getElementById("PalabrasMagicas").innerHTML =  "Palabras mágicas detectadas: " +  palabrasPalindromos ;
        }
   }
   );

}