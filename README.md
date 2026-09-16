# VLAN Trunking y SVI

Simulación de una red con VLAN Trunking y Switch Virtual Interface (SVI) para inter-VLAN routing.

## 🏗️ Topología

- 2 Switches Cisco 2960
- 4 PCs (2 por VLAN)
- 1 Trunk entre switches
- VLAN 10: Administración (192.168.10.0/24)
- VLAN 20: Ventas (192.168.20.0/24)

## ⚙️ Configuración

### Crear VLANs
```
vlan 10
 name Administracion
vlan 20
 name Ventas
```

### Asignar puertos a VLAN
```
interface range Fa0/1-2
 switchport mode access
 switchport access vlan 10

interface range Fa0/3-4
 switchport mode access
 switchport access vlan 20
```

### Configurar Trunk
```
interface Fa0/24
 switchport mode trunk
 switchport trunk allowed vlan 10,20
```

### Crear SVI (gateway de cada VLAN)
```
interface vlan 10
 ip address 192.168.10.1 255.255.255.0
 no shutdown

interface vlan 20
 ip address 192.168.20.1 255.255.255.0
 no shutdown
```

## ✅ Resultados

- ✓ Dispositivos en la misma VLAN se comunican directamente
- ✓ Dispositivos en diferentes VLANs se comunican via SVI (inter-VLAN routing)
- ✓ Todo configurado en CLI

## 📚 Conceptos

**VLAN:** Segmentación lógica de una red física  
**Trunk:** Enlace que permite múltiples VLANs en un cable  
**SVI:** Interface virtual que actúa como gateway para cada VLAN
