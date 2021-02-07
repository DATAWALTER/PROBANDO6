package misrc;

import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class MetodoArchivoSerial {

    public boolean crear(String fichero) {
        boolean bandera = true;
        try {
            ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(fichero));
            oos.close();
            System.out.println("CREACION CORRECTA");
        } catch (Exception e) {
            e.printStackTrace();
            bandera = false;
        }
        return bandera;
    }

    public boolean escribir(String fichero, Alumno r) {
        boolean bandera = true;
        try {
            MiObjectOutputStream moos = new MiObjectOutputStream(new FileOutputStream(fichero, true)); //Se usa un ObjectOutputStream que no escriba una cabecera en el stream.
            moos.writeUnshared(r);
            moos.close();
            System.out.println("ESCRITURA CORRECTA");
        } catch (Exception e) {
            e.printStackTrace();
            bandera = false;
        }
        return bandera;
    }

    public List<Alumno> leer(String fichero) {
        
        System.out.println("ENTRO");
        List<Alumno> rectangulos_al = new ArrayList<Alumno>();
        try {
            Alumno r = null;
            ObjectInputStream ois = new ObjectInputStream(new FileInputStream(fichero)); //Se crea un ObjectInputStream
            Object object = ois.readObject(); //Se lee el primer objeto
            while (object != null) { //Mientras haya objetos
                if (object instanceof Alumno) {
                    r = (Alumno) object;
                    rectangulos_al.add(r);
                }
                object = ois.readObject();
            }
            ois.close();
        } catch (EOFException e) {
            System.out.println("LECTURA CORRECTA");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            rectangulos_al = null;
        }
        return rectangulos_al;
    }

    public String rutaAbsolutaArchivo(String carpeta, String nombreArchivo) {
        File f = new File(carpeta);
        String rutaAbsolutaCarpeta = f.getAbsolutePath();
        String separador = System.getProperty("file.separator");
        String rutaAbsolutaArchivo = rutaAbsolutaCarpeta + separador + nombreArchivo;
        return rutaAbsolutaArchivo;
    }

    public String rutaAbsolutaArchivo1(String carpeta, String nombreArchivo) {
        File f = new File(carpeta+"/"+nombreArchivo);
        String rutaAbsolutaArchivo = f.getAbsolutePath();
        return rutaAbsolutaArchivo;
    }
}
