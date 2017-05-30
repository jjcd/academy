/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author JUAN JOSE
 */
public class DivisionClass {
    private String valor;
    private String solucion;
    private String solucionUsuario;
    private String usuario;
    private String idDivison;

    public String getIdDivison() {
        return idDivison;
    }
    
    public DivisionClass(){
        
    }
    
    public DivisionClass(String v, String s, String sU, String u){
        this.valor = v;
        this.solucion = s;
        this.solucionUsuario = sU;
        this.usuario = u;
    }    
    
    public String getValor(){
        return this.valor;
    }
    
    public String getSolucion(){
        return this.solucion;
    }
    
    public String getSolucionUsuario(){
        return this.solucionUsuario;
    }
    
    public String getUsuario(){
        return this.usuario;
    }
}
