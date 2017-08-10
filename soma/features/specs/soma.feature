#language: pt

Funcionalidade: Soma
  
Esquema do Cenario: Soma de valores
  
  Quando faço a soma de <v1> + <v2>
  Então o resultado é <v3>
  
  Exemplos:
      | v1 | v2 | v3 | 
      | 4  | 4  | 8  | 
      | 5  | 3  | 8  | 
      | 7  | 3  | 10 | 
      | 1  | 5  | 6  | 