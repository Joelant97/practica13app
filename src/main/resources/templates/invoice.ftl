<html class="fixed">
<#include "header.ftl">
<body>

<section class="body">

    <#include "body_header.ftl">

    <div class="inner-wrapper">
        <#include "sidebar.ftl">

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Invoice</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="index.html">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Pages</span></li>
                        <li><span>Invoice</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->

            <section class="panel">
                <div class="panel-body">
                    <div class="invoice">
                        <header class="clearfix">
                            <div class="row">
                                <div class="col-sm-6 mt-md">
                                    <h2 class="h2 mt-none mb-sm text-dark text-bold">INVOICE</h2>
                                    <h4 class="h4 m-none text-dark text-bold"># ${factura.getId()}</h4>
                                </div>

                            </div>
                        </header>
                        <div class="bill-info">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="bill-to">
                                        <p class="h5 mb-xs text-dark text-semibold">To:</p>
                                        <address>
                                            ${factura.getCliente().getNombre()}
                                            <br/>
                                            ${factura.getCliente().getCedula()}
                                            <br/>
                                        </address>127
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="bill-data text-right">
                                        <p class="mb-none">
                                            <span class="text-dark">Invoice Date:</span>
                                            <span class="value">${factura.getFechaFacturacion()}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table invoice-items">
                                <thead>
                                <tr class="h4 text-dark">
                                    <th id="cell-id" class="text-semibold">#</th>
                                    <th id="cell-item" class="text-semibold">Item</th>
                                    <th id="cell-price" class="text-center text-semibold">Price</th>
                                    <th id="cell-price" class="text-center text-semibold">Cantidad</th>
                                    <th id="cell-total" class="text-center text-semibold">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list  factura.getAlquileres() as alquiler>
                                    <tr>
                                        <td>${alquiler.getId()}</td>
                                        <td class="text-semibold text-dark">${alquiler.getEquipo().getNombreEquipo()}</td>
                                        <td class="text-center">${alquiler.getEquipo().getPrecio()}</td>
                                        <td class="text-center">${alquiler.getCantidad()}</td>
                                        <td class="text-center">${alquiler.getCosto()}</td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>

                        <div class="invoice-summary">
                            <div class="row">
                                <div class="col-sm-4 col-sm-offset-8">
                                    <table class="table h5 text-dark">
                                        <tbody>
                                        <tr class="b-top-none">
                                            <td colspan="2">Subtotal</td>
                                            <td class="text-left">${factura.getMontoTotal()}</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Shipping</td>
                                            <td class="text-left">$0.00</td>
                                        </tr>
                                        <tr class="h4">
                                            <td colspan="2">Grand Total</td>
                                            <td class="text-left">${factura.getMontoTotal()}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="text-right mr-lg">
                        <a href="/alquileres/" class="btn btn-default">Submit Invoice</a>
                    </div>
                </div>
            </section>

            <!-- end: page -->
        </section>
    </div>

    <#include "sidebar-right.ftl">
</section>

<#include "footer.ftl">

</body>
</html>