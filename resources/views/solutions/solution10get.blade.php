@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-left">{{ $header }}</h1>
    </section>
    <div class="content">
        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                @include('flash::message')
                <div class="clearfix"></div>

                <div class="text-center">
                    <img src="{{ asset('img/' . (isset($img_name) ? $img_name : '')) }}"  width="640px" alt=""/>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                {!! Form::open(['route' => 'solution10post']) !!}

                <!-- Input Field -->
                    <div class="form-group col-sm-6">
                        {!! Form::label('input', 'Lutfen Sorguya Uygun Input Giriniz:') !!}
                        {!! Form::text('input', null, ['class' => 'form-control']) !!}
                    </div>

                    <!-- Submit Field -->
                    <div class="form-group col-sm-12">
                        {!! Form::submit('Baslat', ['class' => 'btn btn-primary']) !!}
                    </div>

                    {!! Form::close() !!}
                </div>

            </div>
        </div>


        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                @if(isset($result))
                    @include('solutions.basequerytable')
                @endif
            </div>
        </div>
        <div class="text-center">

        </div>
    </div>
@endsection

