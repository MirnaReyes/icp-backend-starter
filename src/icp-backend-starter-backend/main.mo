//Mirna Reyes
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";

actor TiendaUniformes {
  type FolioPoliciaco = Text;
  type Cliente = {
    nombre: Text;
    folioPoliciaco: FolioPoliciaco;
    departamento: Text;
    compraUniforme: Text; // Codigo del producto  o detalles del uniforme
  };

  let clientes = HashMap.HashMap<FolioPoliciaco, Cliente>(0, Text.equal, Text.hash);

  // Función para crear un registro de cliente
  public func crearRegistro(nombre: Text, folioPoliciaco: FolioPoliciaco, departamento: Text, compraUniforme: Text) {
    let cliente = {nombre; folioPoliciaco; departamento; compraUniforme};
    clientes.put(folioPoliciaco, cliente);
    Debug.print("Registro de cliente creado exitosamente.");
  };

  // Función para leer el registro de un cliente por su folio policiaco
  public query func leerRegistro(folioPoliciaco: FolioPoliciaco): async ?Cliente {
    return clientes.get(folioPoliciaco);
  };

  // Función para leer todos los registros de clientes
  public query func leerRegistros(): async [(FolioPoliciaco, Cliente)] {
    let primerPaso = clientes.entries();
    let segundoPaso: [(FolioPoliciaco, Cliente)] = Iter.toArray(primerPaso);
    return segundoPaso;
  };

  // Función para eliminar el registro de un cliente por su folio policiaco
  public func eliminarRegistro(folioPoliciaco: FolioPoliciaco) {
    switch (clientes.remove(folioPoliciaco)) {
      case (?cliente) { Debug.print("Registro de cliente eliminado exitosamente."); };
      case null { Debug.print("No se encontró el cliente con ese folio."); };
    };
  };
};
