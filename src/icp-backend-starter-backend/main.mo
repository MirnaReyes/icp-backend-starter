//Nombre:Mirna Reyes
//Pais:Mexico
//Experiencia: Estudiante TICS

actor Nombre {
 var nombre: Text = "Mirna";
 
  public query func MiNombre(): async Text {
    return nombre;

  };
  public func guardarNombre(name: Text){
    nombre := name;
  };
    
};
