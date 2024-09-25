import { Component, OnInit } from '@angular/core';
import * as L from 'leaflet';

@Component({
  selector: 'app-mapa',
  templateUrl: './mapa.component.html',
  styleUrls: ['./mapa.component.scss']
})
export class MapaComponent implements OnInit {

  private map: any;

  constructor() { }

  ngOnInit() {
    this.initMap();
    this.loadGeoJSON();
  }

  private initMap(): void {
    // Inicializa o mapa e define uma posição inicial (pode ser ajustada mais tarde)
    this.map = L.map('map').setView([51.505, -0.09], 2); // Posição padrão, será ajustada no GeoJSON
  
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
    }).addTo(this.map);
  }
  
  private loadGeoJSON(): void {
    fetch('assets/geojson/cidade_sp.geojson')
      .then(res => res.json())
      .then(data => {
        // Adiciona o GeoJSON ao mapa
        L.geoJSON(data).addTo(this.map);
    
        // Localizar a propriedade "CORD_CENTRAL" no GeoJSON
        const cordCentral = data.features[0].properties.CORD_CENTRAL;
        
        // Extraindo as coordenadas do campo "CORD_CENTRAL"
        const coordinates = cordCentral.match(/POINT \(([^)]+)\)/)[1].split(' ');
        const longitude = parseFloat(coordinates[0]);
        const latitude = parseFloat(coordinates[1]);
    
        // Reposicionar a visualização do mapa com base nas coordenadas extraídas
        this.map.setView([latitude, longitude], 10);  // Definindo a posição e zoom corretos
      });
  }
  
}
