/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dominio;

/**
 * 
 * @author diego
 */
public class Genero {
    
    private int id;
    private String genero;

    public Genero() {
    }

    public Genero(int id) {
        this.id = id;
    }

    public Genero(String genero) {
        this.genero = genero;
    }
    
    public Genero(int id, String genero) {
        this.id = id;
        this.genero = genero;
    }

    public Genero(Genero genero) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

}
