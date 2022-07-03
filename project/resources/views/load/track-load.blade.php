                        @if(isset($order))
                    <div class="tracking-steps-area">
							<p>Payment Status : {{$order->payment_status}} </p>
							<p>Delivery Status : {{ ucfirst($order->status) }}</p>
                            <ul class="tracking-steps">
                                @foreach($order->tracks as $track)
                                    <li class="{{ in_array($track->title, $datas) ? 'active' : '' }}">
                                        <div class="icon">{{ $loop->index + 1 }}</div>
                                        <div class="content">
                                                <h4 class="title">{{ ucwords($track->title)}} ({{ date('d M, Y',strtotime($track->created_at)) }})</h4>
                                                <p class="details">{{ $track->text }}</p>
                                        </div>
                                    </li>
                                @endforeach

                                </ul>
                    </div>


                        @else 
                        <h3 class="text-center">{{ $langg->lang775 }}</h3>
                        @endif          