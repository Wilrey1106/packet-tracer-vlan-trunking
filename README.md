# VLAN Trunking y SVI

Simulación de una red con VLAN Trunking y Switch Virtual Interface (SVI) para inter-VLAN routing.

## Topología

- 1 Layer 3 Switch (Multilayer Switch)
- 2 Switches Cisco 2960
- 6 PCs
- 1 Router
- 1 Servidor
- Trunks entre switches

**VLANs:**
- VLAN 10: Administración (192.168.10.0/24)
- VLAN 20: Técnicos (192.168.20.0/24)
- VLAN 30: Visitantes (192.168.30.0/24) - Bloqueada con permisos limitados
- VLAN 40: Servidores (192.168.40.0/24)

## Asignación de Dispositivos

| Dispositivo | VLAN | Rol |
|---|---|---|
| PC A - PC B | 10 | Administración |
| PC C | 20 | Técnico |
| PC D - PC E - PC F | 30 | Visitantes |
| Server-PT | 40 | Servidor |
| Router ISP | - | Gateway externo |

## Configuración

### Crear VLANs
```
vlan 10
 name Administracion
vlan 20
 name Tecnicos
vlan 30
 name Visitantes
vlan 40
 name Servidores
```

### Asignar puertos a VLAN (Switch 1 - Access)
```
interface range Fa0/1-2
 switchport mode access
 switchport access vlan 10

interface Fa0/3
 switchport mode access
 switchport access vlan 20
```

### Asignar puertos a VLAN (Switch 2 - Access)
```
interface Fa0/1
 switchport mode access
 switchport access vlan 20

interface range Fa0/2-4
 switchport mode access
 switchport access vlan 30
```

### Configurar Trunks
```
interface Fa0/24
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,40

interface Fa0/48
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,40
```

### Crear SVI (gateway de cada VLAN)
```
interface vlan 10
 ip address 192.168.10.1 255.255.255.0
 no shutdown

interface vlan 20
 ip address 192.168.20.1 255.255.255.0
 no shutdown

interface vlan 30
 ip address 192.168.30.1 255.255.255.0
 no shutdown

interface vlan 40
 ip address 192.168.40.1 255.255.255.0
 no shutdown
```

##  Resultados

- ✓ 4 VLANs configuradas y activas
- ✓ 2 Switches de acceso + 1 Layer 3 Switch para enrutamiento
- ✓ Trunks configurados entre switches (Fa0/24, Fa0/48)
- ✓ Dispositivos en la misma VLAN se comunican directamente
- ✓ Inter-VLAN routing funcional (VLAN 10, 20, 40)
- ✓ VLAN 30 (Visitantes) con permisos limitados vía ACLs
- ✓ Servidor en VLAN 40 accesible desde otras VLANs
- ✓ Router ISP conectado al Layer 3 Switch para salida a Internet

<img width="1239" height="647" alt="image" src="https://github.com/user-attachments/assets/dc974e73-ea65-4f6e-b842-0a846213d71a" />

##  Conceptos

**VLAN:** Segmentación lógica de una red física  
**Trunk:** Enlace que permite múltiples VLANs en un cable  
**SVI:** Interface virtual que actúa como gateway para cada VLAN

