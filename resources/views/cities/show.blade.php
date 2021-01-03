@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Şehir
        </h1>
    </section>
    <div class="content">
        <div class="box box-primary">
            <div class="box-body">
                <div class="row" style="padding-left: 20px">
                    @include('cities.show_fields')
                    <a href="{{ route('cities.index') }}" class="btn btn-default">Geri</a>
                </div>
            </div>
        </div>
    </div>
@endsection
