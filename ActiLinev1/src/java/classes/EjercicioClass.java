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
public class EjercicioClass {

    private String id;
    private String valor;
    private String web;
    private String tipoEjercicio;
    private String numSol;

    public EjercicioClass(String valor, String web) {
        this.valor = valor;
        this.web = web;
    }
    
    public EjercicioClass(String valor, String web, String tipoEjercicio) {
        this.valor = valor;
        this.web = web;
        this.tipoEjercicio = tipoEjercicio;
    }
    
    public EjercicioClass(String id, String valor, String web, String tipoEjercicio) {
        this.id = id;
        this.valor = valor;
        this.web = web;
        this.tipoEjercicio = tipoEjercicio;
    }

    public EjercicioClass(String id, String valor, String web, String tipoEjercicio, String numSol) {
        this.id = id;
        this.valor = valor;
        this.web = web;
        this.tipoEjercicio = tipoEjercicio;
        this.numSol = numSol;
    }    
    
    public String getValor() {
        return valor;
    }

    public String getWeb() {
        return web;
    }
    
    public String getTipoEjercicio(){
        return tipoEjercicio;
    }

    public String getId() {
        return id;
    }

    public String getNumSol() {
        return numSol;
    }    
}
