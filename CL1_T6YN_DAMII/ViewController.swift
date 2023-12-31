//
//  ViewController.swift
//  CL1_T6YN_DAMII
//
//  Created by Sadohu on 29/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tvCostos: UITableView!
    @IBOutlet weak var txtServicio: UITextField!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var imgServicio: UIImageView!
    var listaServicios : [Servicio] = [];
    var setInfo = 0;
    var servicio : Double = 0.0;
    var instalacion : Double = 0.0;
    var porcentaje : Double = 0.0;
    var descuento : Double = 0.0;
    var totalServicio : Double = 0.0;
    var imgName : String = "cheems";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvCostos.dataSource = self;
        llenarServicios();
    }
    
    func llenarServicios(){
        listaServicios.append(Servicio(codigo: 1, servicio: 109.00, instalacion: 35.00, descuento: 0.05, image: "trio"));
        listaServicios.append(Servicio(codigo: 2, servicio: 99.00, instalacion: 30.00, descuento: 0.04, image: "duo"));
        listaServicios.append(Servicio(codigo: 3, servicio: 89.00, instalacion: 15.00, descuento: 0.02, image: "internet"));
        listaServicios.append(Servicio(codigo: 4, servicio: 59.00, instalacion: 12.00, descuento: 0.01, image: "telefono"));
        listaServicios.append(Servicio(codigo: 5, servicio: 79.00, instalacion: 15.00, descuento: 0.01, image: "cable"));
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        imgServicio.image = UIImage(named: imgName);
        switch indexPath.row{
        case 0:
            let titulo = tvCostos.dequeueReusableCell(withIdentifier: "titulo") as! TituloTableViewCell;
            return titulo;
        case 1:
            let precio = tvCostos.dequeueReusableCell(withIdentifier: "precio") as! PrecioTableViewCell;
            precio.precServicio.text = String(servicio);
            precio.precInstalacion.text = String(instalacion);
            precio.precDescuento.text = String(descuento);
            return precio;
        case 2:
            let total = tvCostos.dequeueReusableCell(withIdentifier: "total") as! TotalTableViewCell;
            total.precTotal.text = String(totalServicio);
            return total;
        default:
            return UITableViewCell();
        }
    }
    
    @IBAction func btnCalcular(_ sender: UIButton) {
        setInfo = Int(txtServicio.text ?? "0") ?? 0;
        if(setInfo > 0 && setInfo <= listaServicios.count){
            lblTitulo.text = "Costos";
            lblTitulo.textColor = UIColor.black;
            asignarValores(setInfo);
        }else{
            lblTitulo.text = "Ingrese un servicio válido!!!";
            lblTitulo.textColor = UIColor.red;
            asignarValores(0)
        }
        tvCostos.reloadData();
    }
    
    func asignarValores(_ valor :Int){
        if(valor != 0){
            servicio = listaServicios[valor - 1].servicio;
            instalacion = listaServicios[valor - 1].instalacion;
            porcentaje = listaServicios[valor - 1].descuento;
            descuento = (servicio + instalacion) * porcentaje;
            totalServicio = (servicio + instalacion) - descuento;
            imgName = listaServicios[valor - 1].image;
        }else{
            servicio = 0;
            instalacion = 0;
            porcentaje = 0;
            descuento = 0;
            totalServicio = 0;
            imgName = "cheems";
        }
    }
}

