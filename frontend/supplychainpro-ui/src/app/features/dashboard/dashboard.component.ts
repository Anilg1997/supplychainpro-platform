import { Component } from '@angular/core';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent {
  recentOrders = [
    { poNumber: 'PO-2024-001', supplier: 'TechSupply Co.', amount: '$45,200', status: 'Delivered' },
    { poNumber: 'PO-2024-002', supplier: 'GlobalParts Ltd.', amount: '$12,800', status: 'In Transit' },
    { poNumber: 'PO-2024-003', supplier: 'RawMaterials Inc.', amount: '$89,500', status: 'Pending' },
    { poNumber: 'PO-2024-004', supplier: 'PackPro Solutions', amount: '$23,100', status: 'Processing' },
    { poNumber: 'PO-2024-005', supplier: 'ElectroSys Corp.', amount: '$67,300', status: 'Delivered' },
  ];

  alerts = [
    { icon: 'warning', message: 'Inventory low: SKU-TITAN-082', time: '2 hours ago', severity: 'high' },
    { icon: 'info', message: 'PO-2024-003 requires approval', time: '3 hours ago', severity: 'medium' },
    { icon: 'check_circle', message: 'Quality check #QC-045 passed', time: '5 hours ago', severity: 'low' },
    { icon: 'local_shipping', message: 'Shipment SHP-029 departed', time: '8 hours ago', severity: 'low' },
    { icon: 'payment', message: 'Invoice INV-2024-089 overdue', time: '1 day ago', severity: 'high' },
  ];
}
