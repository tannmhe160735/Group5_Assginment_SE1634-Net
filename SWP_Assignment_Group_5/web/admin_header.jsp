<header class="main-header " id="header">
        <nav class="navbar navbar-static-top navbar-expand-lg">
          <!-- Sidebar toggle button -->
          <button id="sidebar-toggler" class="sidebar-toggle">
            <span class="sr-only">Toggle navigation</span>
          </button>
          <!-- search form -->
          <div class="search-form d-none d-lg-inline-block">
            <div class="input-group">
              <button type="button" name="search" id="search-btn" class="btn btn-flat">
                <i class="mdi mdi-magnify"></i>
              </button>
              <input type="text" name="query" id="search-input" class="form-control"
                placeholder="'button', 'chart' etc." autofocus autocomplete="off" />
            </div>
            <div id="search-results-container">
              <ul id="search-results"></ul>
            </div>
          </div>

          <div class="navbar-right ">
            <ul class="nav navbar-nav">

              <!-- User Account -->
              <li class="dropdown user-menu">
                <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <img src="https://images4.alphacoders.com/117/1172742.jpg" class="user-image" alt="User Image" />
                  <span class="d-none d-lg-inline-block">${sessionScope.acc.acc_name}</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                  <!-- User image -->
                  <li class="dropdown-header">
                      <img src="https://images4.alphacoders.com/117/1172742.jpg" class="img-circle" alt="User Image" />
                    <div class="d-inline-block">
                      ${sessionScope.acc.acc_name} <small class="pt-1">${sessionScope.acc.email}</small>
                    </div>
                  </li>

                  <li>
                    <a href="user-profile.html">
                      <i class="mdi mdi-account"></i> My Profile
                    </a>
                  </li>
                  <li class="right-sidebar-in">
                    <a href="javascript:0"> <i class="mdi mdi-settings"></i> Setting </a>
                  </li>
                  <li class="dropdown-footer">
                    <a href="${sessionScope.log}"> <i class="mdi mdi-logout"></i> ${sessionScope.value_log} </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
