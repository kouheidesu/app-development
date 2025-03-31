@extends('layouts.app')

@section('content')
<div class="max-w-2xl p-6 mx-auto mt-6 bg-white shadow-md rounded-xl">
    <h2 class="mb-6 text-2xl font-bold text-center text-gray-800">投稿フォーム</h2>

    <form method="POST" action="/" class="mb-10 space-y-4">
        @csrf
        <div>
            <label class="block mb-1 text-sm font-medium text-gray-700">名前：</label>
            <input type="text" name="name" required
                class="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <div>
            <label class="block mb-1 text-sm font-medium text-gray-700">タスク：</label>
            <textarea name="task" rows="4" required
                class="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
        </div>
        <button type="submit"
            class="w-full py-2 text-white transition bg-blue-600 rounded-lg hover:bg-blue-700">
            投稿
        </button>
    </form>

    <h3 class="mb-4 text-xl font-semibold text-gray-800">投稿一覧</h3>

    @foreach($posts as $post)
    <div class="p-4 mb-4 border border-gray-200 rounded-lg shadow-sm bg-gray-50">
        <div class="font-bold text-gray-900">{{ $post->name }}</div>
        <div class="text-sm text-gray-500">{{ $post->created_at }}</div>
        <div class="mt-2 text-gray-700 whitespace-pre-line">{!! nl2br(e($post->task)) !!}</div>
    </div>
    @endforeach
</div>
@endsection
