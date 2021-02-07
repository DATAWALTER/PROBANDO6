package misrc;

import java.io.Serializable;

public class Alumno implements Serializable {
    
    //ATRIBUTOS

    private int id;
    private String nombre;
    private double estatura;
    
    //CONSTRUCTORES

    public Alumno() {
    }

    public Alumno(int id, String nombre, double estatura) {
        this.id = id;
        this.nombre = nombre;
        this.estatura = estatura;
    }
    
    //SET Y GET

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }
    
    //OTROS

    @Override
    public String toString() {
        return "Alumno{" + "id=" + id + ", nombre=" + nombre + ", estatura=" + estatura + '}';
    }
}
