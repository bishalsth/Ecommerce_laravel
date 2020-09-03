<div class="left-sidebar " style="padding-left:20px;">
						<h2>Category</h2>
						<div class="panel-group category-products " id="accordian"><!--category-productsr-->
							<div class="panel panel-default border border-dark" >
                                @foreach($categories as $cat)
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#{{$cat->id}}">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											{{$cat->name}}
										</a>
									</h4>
								</div>
								<div id="{{$cat->id}}" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
                                            @foreach($cat->categories as $subcat)
											<li><a href="{{asset('/products/'.$subcat->url)}}">{{$subcat->name}} </a></li>
											@endforeach
										</ul>
									</div>
                                </div>
                                @endforeach
							</div>
							<br> <br>

						
							<div class="shipping text-center"><!--shipping-->
							<img src="{{asset( 'img/frontend_images/home/shipping.jpg ') }}" alt="" />
						</div><!--/shipping-->

						<br> <br>

							
						
							<div class="shipping text-center"><!--shipping-->
							<img src="{{asset( 'img/frontend_images/ss.gif') }}" alt="" />
						</div><!--/shipping-->
							
						<br>

						
							<div class="shipping text-center"><!--shipping-->
							<img src="{{asset( 'img/frontend_images/adv.jpg ') }}" height="250px" alt="" />
						</div><!--/shipping-->

							
						</div><!--/category-products-->
					
						
					</div>