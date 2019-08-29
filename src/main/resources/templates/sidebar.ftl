<!-- start: sidebar -->
<aside id="sidebar-left" class="sidebar-left">

    <div class="sidebar-header">
        <div class="sidebar-title">
            Navigation
        </div>
        <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>
    <div class="nano">
        <div class="nano-content">
            <nav id="menu" class="nav-main" role="navigation">
                <ul class="nav nav-main">
                    <li>
                        <a href="/">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            <span><@spring.message "home"/></span>
                        </a>
                    </li>
                    <li>
                        <a href="/usuarios/">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <span><@spring.message "usuarios"/></span>
                        </a>
                    </li>
                    <li>
                        <a href="/clientes/">
                            <i class="fa fa-users" aria-hidden="true"></i>
                            <span><@spring.message "clientes"/></span>
                        </a>
                    </li>
                    <li>
                        <a href="/categorias/">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            <span><@spring.message "categorias"/></span>
                        </a>
                    </li>
                    <li>
                        <a href="/subcategorias/">
                            <i class="fa fa-table" aria-hidden="true"></i>
                            <span><@spring.message "subcategorias"/></span>
                        </a>
                    </li>
                    <li>
                        <a href="/equipos/">
                            <i class="fa fa-table" aria-hidden="true"></i>
                            <span><@spring.message "equipos"/></span>
                        </a>
                    </li>
                    <li class="nav-parent">
                        <a>
                            <i class="fa fa-list" aria-hidden="true"></i>
                            <span><@spring.message "alquileres"/></span>
                        </a>
                        <ul class="nav nav-children">
                            <li>
                                <a href="/alquileres/"><@spring.message "administrar"/></a>
                            </li>
                        </ul>
                        <ul class="nav nav-children">
                            <li>
                                <a href="/alquileres/nodevueltos/"><@spring.message "nodevueltos"/></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>

            <hr class="separator" />
            <hr class="separator" />


        </div>

    </div>

</aside>
<!-- end: sidebar -->
