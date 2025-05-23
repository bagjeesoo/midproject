<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<head>
	<script type="text/javascript" crossorigin="anonymous" async="" src="https://us-assets.i.posthog.com/static/array.js"></script><script src="https://static.readdy.ai/static/e.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TripIn 관리자 대시보드</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>tailwind.config={theme:{extend:{colors:{primary:'#4F46E5',secondary:'#818CF8'},borderRadius:{'none':'0px','sm':'4px',DEFAULT:'8px','md':'12px','lg':'16px','xl':'20px','2xl':'24px','3xl':'32px','full':'9999px','button':'8px'}}}}</script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>
    <script type="text/javascript" src="resources/admin.js"></script>
    <style>
        :where([class^="ri-"])::before { content: "\f3c2"; }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f9fafb;
        }
        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .custom-checkbox {
            display: inline-block;
            position: relative;
            cursor: pointer;
        }
        .custom-checkbox input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 18px;
            width: 18px;
            background-color: #fff;
            border: 1px solid #d1d5db;
            border-radius: 4px;
        }
        .custom-checkbox input:checked ~ .checkmark {
            background-color: #4F46E5;
            border-color: #4F46E5;
        }
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }
        .custom-checkbox input:checked ~ .checkmark:after {
            display: block;
        }
        .custom-checkbox .checkmark:after {
            left: 6px;
            top: 2px;
            width: 5px;
            height: 10px;
            border: solid white;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }
        .custom-switch {
            position: relative;
            display: inline-block;
            width: 48px;
            height: 24px;
        }
        .custom-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .switch-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #e5e7eb;
            transition: .4s;
            border-radius: 24px;
        }
        .switch-slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 3px;
            bottom: 3px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        input:checked + .switch-slider {
            background-color: #4F46E5;
        }
        input:checked + .switch-slider:before {
            transform: translateX(24px);
        }
    </style>
<style>*, ::before, ::after{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:rgb(59 130 246 / 0.5);--tw-ring-offset-shadow:0 0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 #0000;--tw-shadow-colored:0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: ;--tw-contain-size: ;--tw-contain-layout: ;--tw-contain-paint: ;--tw-contain-style: }::backdrop{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:rgb(59 130 246 / 0.5);--tw-ring-offset-shadow:0 0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 #0000;--tw-shadow-colored:0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: ;--tw-contain-size: ;--tw-contain-layout: ;--tw-contain-paint: ;--tw-contain-style: }/* ! tailwindcss v3.4.16 | MIT License | https://tailwindcss.com */*,::after,::before{box-sizing:border-box;border-width:0;border-style:solid;border-color:#e5e7eb}::after,::before{--tw-content:''}:host,html{line-height:1.5;-webkit-text-size-adjust:100%;-moz-tab-size:4;tab-size:4;font-family:ui-sans-serif, system-ui, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";font-feature-settings:normal;font-variation-settings:normal;-webkit-tap-highlight-color:transparent}body{margin:0;line-height:inherit}hr{height:0;color:inherit;border-top-width:1px}abbr:where([title]){-webkit-text-decoration:underline dotted;text-decoration:underline dotted}h1,h2,h3,h4,h5,h6{font-size:inherit;font-weight:inherit}a{color:inherit;text-decoration:inherit}b,strong{font-weight:bolder}code,kbd,pre,samp{font-family:ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;font-feature-settings:normal;font-variation-settings:normal;font-size:1em}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sub{bottom:-.25em}sup{top:-.5em}table{text-indent:0;border-color:inherit;border-collapse:collapse}button,input,optgroup,select,textarea{font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;letter-spacing:inherit;color:inherit;margin:0;padding:0}button,select{text-transform:none}button,input:where([type=button]),input:where([type=reset]),input:where([type=submit]){-webkit-appearance:button;background-color:transparent;background-image:none}:-moz-focusring{outline:auto}:-moz-ui-invalid{box-shadow:none}progress{vertical-align:baseline}::-webkit-inner-spin-button,::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}summary{display:list-item}blockquote,dd,dl,figure,h1,h2,h3,h4,h5,h6,hr,p,pre{margin:0}fieldset{margin:0;padding:0}legend{padding:0}menu,ol,ul{list-style:none;margin:0;padding:0}dialog{padding:0}textarea{resize:vertical}input::placeholder,textarea::placeholder{opacity:1;color:#9ca3af}[role=button],button{cursor:pointer}:disabled{cursor:default}audio,canvas,embed,iframe,img,object,svg,video{display:block;vertical-align:middle}img,video{max-width:100%;height:auto}[hidden]:where(:not([hidden=until-found])){display:none}.absolute{position:absolute}.relative{position:relative}.right-2{right:0.5rem}.top-2{top:0.5rem}.z-10{z-index:10}.mb-4{margin-bottom:1rem}.mb-6{margin-bottom:1.5rem}.ml-1{margin-left:0.25rem}.ml-2{margin-left:0.5rem}.ml-3{margin-left:0.75rem}.ml-4{margin-left:1rem}.mr-2{margin-right:0.5rem}.mr-3{margin-right:0.75rem}.mt-1{margin-top:0.25rem}.mt-4{margin-top:1rem}.flex{display:flex}.grid{display:grid}.hidden{display:none}.h-10{height:2.5rem}.h-2{height:0.5rem}.h-4{height:1rem}.h-5{height:1.25rem}.h-64{height:16rem}.h-8{height:2rem}.h-full{height:100%}.h-screen{height:100vh}.min-h-screen{min-height:100vh}.w-10{width:2.5rem}.w-2{width:0.5rem}.w-4{width:1rem}.w-5{width:1.25rem}.w-64{width:16rem}.w-8{width:2rem}.w-full{width:100%}.min-w-full{min-width:100%}.flex-1{flex:1 1 0%}.grid-cols-1{grid-template-columns:repeat(1, minmax(0, 1fr))}.flex-col{flex-direction:column}.items-end{align-items:flex-end}.items-center{align-items:center}.justify-center{justify-content:center}.justify-between{justify-content:space-between}.gap-6{gap:1.5rem}.space-x-2 > :not([hidden]) ~ :not([hidden]){--tw-space-x-reverse:0;margin-right:calc(0.5rem * var(--tw-space-x-reverse));margin-left:calc(0.5rem * calc(1 - var(--tw-space-x-reverse)))}.space-x-4 > :not([hidden]) ~ :not([hidden]){--tw-space-x-reverse:0;margin-right:calc(1rem * var(--tw-space-x-reverse));margin-left:calc(1rem * calc(1 - var(--tw-space-x-reverse)))}.space-y-1 > :not([hidden]) ~ :not([hidden]){--tw-space-y-reverse:0;margin-top:calc(0.25rem * calc(1 - var(--tw-space-y-reverse)));margin-bottom:calc(0.25rem * var(--tw-space-y-reverse))}.overflow-hidden{overflow:hidden}.overflow-x-auto{overflow-x:auto}.overflow-y-auto{overflow-y:auto}.rounded{border-radius:8px}.rounded-button{border-radius:8px}.rounded-full{border-radius:9999px}.rounded-r-full{border-top-right-radius:9999px;border-bottom-right-radius:9999px}.border-b{border-bottom-width:1px}.border-t{border-top-width:1px}.border-gray-100{--tw-border-opacity:1;border-color:rgb(243 244 246 / var(--tw-border-opacity, 1))}.border-gray-200{--tw-border-opacity:1;border-color:rgb(229 231 235 / var(--tw-border-opacity, 1))}.bg-blue-100{--tw-bg-opacity:1;background-color:rgb(219 234 254 / var(--tw-bg-opacity, 1))}.bg-gray-100{--tw-bg-opacity:1;background-color:rgb(243 244 246 / var(--tw-bg-opacity, 1))}.bg-gray-200{--tw-bg-opacity:1;background-color:rgb(229 231 235 / var(--tw-bg-opacity, 1))}.bg-gray-50{--tw-bg-opacity:1;background-color:rgb(249 250 251 / var(--tw-bg-opacity, 1))}.bg-green-100{--tw-bg-opacity:1;background-color:rgb(220 252 231 / var(--tw-bg-opacity, 1))}.bg-primary{--tw-bg-opacity:1;background-color:rgb(79 70 229 / var(--tw-bg-opacity, 1))}.bg-purple-100{--tw-bg-opacity:1;background-color:rgb(243 232 255 / var(--tw-bg-opacity, 1))}.bg-red-100{--tw-bg-opacity:1;background-color:rgb(254 226 226 / var(--tw-bg-opacity, 1))}.bg-red-500{--tw-bg-opacity:1;background-color:rgb(239 68 68 / var(--tw-bg-opacity, 1))}.bg-white{--tw-bg-opacity:1;background-color:rgb(255 255 255 / var(--tw-bg-opacity, 1))}.bg-yellow-100{--tw-bg-opacity:1;background-color:rgb(254 249 195 / var(--tw-bg-opacity, 1))}.bg-opacity-10{--tw-bg-opacity:0.1}.p-4{padding:1rem}.p-6{padding:1.5rem}.px-2{padding-left:0.5rem;padding-right:0.5rem}.px-3{padding-left:0.75rem;padding-right:0.75rem}.px-4{padding-left:1rem;padding-right:1rem}.px-6{padding-left:1.5rem;padding-right:1.5rem}.py-1{padding-top:0.25rem;padding-bottom:0.25rem}.py-2{padding-top:0.5rem;padding-bottom:0.5rem}.py-3{padding-top:0.75rem;padding-bottom:0.75rem}.py-4{padding-top:1rem;padding-bottom:1rem}.text-left{text-align:left}.font-\[\'Pacifico\'\]{font-family:'Pacifico'}.text-2xl{font-size:1.5rem;line-height:2rem}.text-sm{font-size:0.875rem;line-height:1.25rem}.text-xl{font-size:1.25rem;line-height:1.75rem}.text-xs{font-size:0.75rem;line-height:1rem}.font-bold{font-weight:700}.font-medium{font-weight:500}.uppercase{text-transform:uppercase}.tracking-wider{letter-spacing:0.05em}.text-blue-600{--tw-text-opacity:1;color:rgb(37 99 235 / var(--tw-text-opacity, 1))}.text-blue-800{--tw-text-opacity:1;color:rgb(30 64 175 / var(--tw-text-opacity, 1))}.text-gray-500{--tw-text-opacity:1;color:rgb(107 114 128 / var(--tw-text-opacity, 1))}.text-gray-600{--tw-text-opacity:1;color:rgb(75 85 99 / var(--tw-text-opacity, 1))}.text-gray-700{--tw-text-opacity:1;color:rgb(55 65 81 / var(--tw-text-opacity, 1))}.text-gray-800{--tw-text-opacity:1;color:rgb(31 41 55 / var(--tw-text-opacity, 1))}.text-green-500{--tw-text-opacity:1;color:rgb(34 197 94 / var(--tw-text-opacity, 1))}.text-green-600{--tw-text-opacity:1;color:rgb(22 163 74 / var(--tw-text-opacity, 1))}.text-green-800{--tw-text-opacity:1;color:rgb(22 101 52 / var(--tw-text-opacity, 1))}.text-primary{--tw-text-opacity:1;color:rgb(79 70 229 / var(--tw-text-opacity, 1))}.text-purple-600{--tw-text-opacity:1;color:rgb(147 51 234 / var(--tw-text-opacity, 1))}.text-red-500{--tw-text-opacity:1;color:rgb(239 68 68 / var(--tw-text-opacity, 1))}.text-red-600{--tw-text-opacity:1;color:rgb(220 38 38 / var(--tw-text-opacity, 1))}.text-red-800{--tw-text-opacity:1;color:rgb(153 27 27 / var(--tw-text-opacity, 1))}.text-white{--tw-text-opacity:1;color:rgb(255 255 255 / var(--tw-text-opacity, 1))}.text-yellow-400{--tw-text-opacity:1;color:rgb(250 204 21 / var(--tw-text-opacity, 1))}.text-yellow-600{--tw-text-opacity:1;color:rgb(202 138 4 / var(--tw-text-opacity, 1))}.shadow{--tw-shadow:0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);--tw-shadow-colored:0 1px 3px 0 var(--tw-shadow-color), 0 1px 2px -1px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)}.shadow-lg{--tw-shadow:0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);--tw-shadow-colored:0 10px 15px -3px var(--tw-shadow-color), 0 4px 6px -4px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)}.shadow-sm{--tw-shadow:0 1px 2px 0 rgb(0 0 0 / 0.05);--tw-shadow-colored:0 1px 2px 0 var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)}.hover\:bg-gray-100:hover{--tw-bg-opacity:1;background-color:rgb(243 244 246 / var(--tw-bg-opacity, 1))}.hover\:bg-gray-50:hover{--tw-bg-opacity:1;background-color:rgb(249 250 251 / var(--tw-bg-opacity, 1))}.hover\:bg-primary\/90:hover{background-color:rgb(79 70 229 / 0.9)}.hover\:text-gray-900:hover{--tw-text-opacity:1;color:rgb(17 24 39 / var(--tw-text-opacity, 1))}.hover\:text-primary:hover{--tw-text-opacity:1;color:rgb(79 70 229 / var(--tw-text-opacity, 1))}@media (min-width: 640px){.sm\:block{display:block}}@media (min-width: 768px){.md\:block{display:block}.md\:hidden{display:none}.md\:grid-cols-2{grid-template-columns:repeat(2, minmax(0, 1fr))}}@media (min-width: 1024px){.lg\:grid-cols-2{grid-template-columns:repeat(2, minmax(0, 1fr))}.lg\:grid-cols-4{grid-template-columns:repeat(4, minmax(0, 1fr))}}</style><link type="image/png" rel="icon" href="https://public.readdy.ai/gen_page/readdy-logo.png"><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Secular+One&amp;display=swap">
</head>
<body class="min-h-screen">
    <div class="flex h-screen overflow-hidden">
        <!-- 사이드바 -->
        <aside class="w-64 bg-white shadow-lg hidden md:block">
            <div class="h-full flex flex-col">
                <div class="p-4 border-b border-gray-100">
                    <h1 class="text-2xl font-['Pacifico'] text-primary">TripIn</h1>
                </div>
                <nav class="flex-1 overflow-y-auto py-4">
                    <ul class="space-y-1">
                        <li>
                            <a href="#" class="flex items-center px-4 py-3 text-sm font-medium bg-primary bg-opacity-10 text-primary rounded-r-full">
                                <div class="w-5 h-5 flex items-center justify-center mr-3">
                                    <i class="ri-dashboard-line"></i>
                                </div>
                                <span>대시보드</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-gray-50 hover:text-primary rounded-r-full">
                                <div class="w-5 h-5 flex items-center justify-center mr-3">
                                    <i class="ri-user-line"></i>
                                </div>
                                <span>사용자 관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-gray-50 hover:text-primary rounded-r-full">
                                <div class="w-5 h-5 flex items-center justify-center mr-3">
                                    <i class="ri-map-pin-line"></i>
                                </div>
                                <span>여행지 정보 관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-gray-50 hover:text-primary rounded-r-full">
                                <div class="w-5 h-5 flex items-center justify-center mr-3">
                                    <i class="ri-star-line"></i>
                                </div>
                                <span>리뷰/평가 관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-gray-50 hover:text-primary rounded-r-full">
                                <div class="w-5 h-5 flex items-center justify-center mr-3">
                                    <i class="ri-bar-chart-line"></i>
                                </div>
                                <span>통계/분석</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-gray-50 hover:text-primary rounded-r-full">
                                <div class="w-5 h-5 flex items-center justify-center mr-3">
                                    <i class="ri-settings-line"></i>
                                </div>
                                <span>설정</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="p-4 border-t border-gray-100">
                    <div class="flex items-center">
                        <div class="w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center">
                            <i class="ri-user-line text-gray-600"></i>
                        </div>
                        <div class="ml-3">
                            <p class="text-sm font-medium text-gray-700">관리자</p>
                            <p class="text-xs text-gray-500">admin@tripin.com</p>
                        </div>
                    </div>
                    <button class="mt-4 w-full flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-primary hover:bg-primary/90 rounded-button">
                        <div class="w-4 h-4 flex items-center justify-center mr-2">
                            <i class="ri-logout-box-line"></i>
                        </div>
                        <span>로그아웃</span>
                    </button>
                </div>
            </div>
        </aside>

        <!-- 메인 콘텐츠 -->
        <div class="flex-1 flex flex-col overflow-hidden">
            <!-- 헤더 -->
            <header class="bg-white shadow-sm z-10">
                <div class="flex items-center justify-between px-6 py-4">
                    <div class="flex items-center">
                        <button class="md:hidden w-10 h-10 flex items-center justify-center text-gray-500 hover:text-gray-900">
                            <i class="ri-menu-line ri-lg"></i>
                        </button>
                        <h1 class="ml-4 text-xl font-medium text-gray-800">대시보드</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <div class="relative">
                            <button class="w-10 h-10 flex items-center justify-center text-gray-500 hover:text-gray-900 relative">
                                <i class="ri-notification-3-line ri-lg"></i>
                                <span class="absolute top-2 right-2 w-2 h-2 bg-red-500 rounded-full"></span>
                            </button>
                        </div>
                        <div class="relative">
                            <button class="flex items-center text-gray-700 hover:text-gray-900">
                                <div class="w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center">
                                    <i class="ri-user-line text-gray-600"></i>
                                </div>
                                <span class="ml-2 text-sm font-medium hidden sm:block">관리자</span>
                                <div class="w-5 h-5 flex items-center justify-center ml-1">
                                    <i class="ri-arrow-down-s-line"></i>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </header>

            <!-- 메인 콘텐츠 영역 -->
            <main class="flex-1 overflow-y-auto bg-gray-50 p-6">
                <!-- 요약 카드 섹션 -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-gray-500 text-sm font-medium">총 방문자 수</h3>
                            <div class="w-10 h-10 rounded-full bg-primary bg-opacity-10 flex items-center justify-center text-primary">
                                <i class="ri-user-line ri-lg"></i>
                            </div>
                        </div>
                        <div class="flex items-end">
                            <span class="text-2xl font-bold text-gray-800">24,521</span>
                            <span class="ml-2 text-sm text-green-500 flex items-center">
                                <i class="ri-arrow-up-line"></i> 12.5%
                            </span>
                        </div>
                        <p class="text-xs text-gray-500 mt-1">지난 30일 대비</p>
                    </div>

                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-gray-500 text-sm font-medium">신규 가입자 수</h3>
                            <div class="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center text-green-600">
                                <i class="ri-user-add-line ri-lg"></i>
                            </div>
                        </div>
                        <div class="flex items-end">
                            <span class="text-2xl font-bold text-gray-800">1,243</span>
                            <span class="ml-2 text-sm text-green-500 flex items-center">
                                <i class="ri-arrow-up-line"></i> 8.3%
                            </span>
                        </div>
                        <p class="text-xs text-gray-500 mt-1">지난 30일 대비</p>
                    </div>

                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-gray-500 text-sm font-medium">새로운 리뷰 수</h3>
                            <div class="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600">
                                <i class="ri-chat-1-line ri-lg"></i>
                            </div>
                        </div>
                        <div class="flex items-end">
                            <span class="text-2xl font-bold text-gray-800">3,782</span>
                            <span class="ml-2 text-sm text-green-500 flex items-center">
                                <i class="ri-arrow-up-line"></i> 5.2%
                            </span>
                        </div>
                        <p class="text-xs text-gray-500 mt-1">지난 30일 대비</p>
                    </div>

                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-gray-500 text-sm font-medium">미처리 신고 건수</h3>
                            <div class="w-10 h-10 rounded-full bg-red-100 flex items-center justify-center text-red-600">
                                <i class="ri-flag-line ri-lg"></i>
                            </div>
                        </div>
                        <div class="flex items-end">
                            <span class="text-2xl font-bold text-gray-800">28</span>
                            <span class="ml-2 text-sm text-red-500 flex items-center">
                                <i class="ri-arrow-up-line"></i> 3.1%
                            </span>
                        </div>
                        <p class="text-xs text-gray-500 mt-1">지난 30일 대비</p>
                    </div>
                </div>

                <!-- 차트 섹션 -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="text-gray-700 font-medium">방문자 추이</h3>
                            <div class="flex space-x-2">
                                <button class="px-3 py-1 text-xs font-medium text-primary bg-primary bg-opacity-10 rounded-full">일간</button>
                                <button class="px-3 py-1 text-xs font-medium text-gray-500 hover:bg-gray-100 rounded-full">주간</button>
                                <button class="px-3 py-1 text-xs font-medium text-gray-500 hover:bg-gray-100 rounded-full">월간</button>
                            </div>
                        </div>
                        <div id="visitors-chart" class="h-64" _echarts_instance_="ec_1747036094373" style="user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative;"><div style="position: relative; width: 530px; height: 256px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="530" height="256" style="position: absolute; left: 0px; top: 0px; width: 530px; height: 256px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class=""></div></div>
                    </div>

                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="text-gray-700 font-medium">사용자 유형 분포</h3>
                            <div class="flex items-center text-gray-500 text-sm">
                                <span>2025년 5월 기준</span>
                            </div>
                        </div>
                        <div id="user-type-chart" class="h-64" _echarts_instance_="ec_1747036094374" style="user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative;"><div style="position: relative; width: 530px; height: 256px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="530" height="256" style="position: absolute; left: 0px; top: 0px; width: 530px; height: 256px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class=""></div></div>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="text-gray-700 font-medium">기능별 이용률</h3>
                            <div class="flex items-center text-gray-500 text-sm">
                                <span>지난 30일</span>
                            </div>
                        </div>
                        <div id="feature-usage-chart" class="h-64" _echarts_instance_="ec_1747036094375" style="user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative;"><div style="position: relative; width: 530px; height: 256px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="530" height="256" style="position: absolute; left: 0px; top: 0px; width: 530px; height: 256px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class=""></div></div>
                    </div>

                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-gray-700 font-medium">인기 여행지 TOP 5</h3>
                            <button class="text-primary text-sm font-medium flex items-center">
                                <span>전체보기</span>
                                <div class="w-4 h-4 flex items-center justify-center ml-1">
                                    <i class="ri-arrow-right-line"></i>
                                </div>
                            </button>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="min-w-full">
                                <thead>
                                    <tr class="border-b border-gray-200">
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">여행지</th>
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">방문자 수</th>
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">평균 평점</th>
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">리뷰 수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4 text-sm text-gray-800">제주도 성산일출봉</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">12,345</td>
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <span class="text-sm text-gray-800 mr-2">4.8</span>
                                                <div class="flex text-yellow-400">
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-half-fill ri-xs"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">1,234</td>
                                    </tr>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4 text-sm text-gray-800">부산 해운대</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">10,987</td>
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <span class="text-sm text-gray-800 mr-2">4.7</span>
                                                <div class="flex text-yellow-400">
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-half-fill ri-xs"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">1,087</td>
                                    </tr>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4 text-sm text-gray-800">서울 경복궁</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">9,876</td>
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <span class="text-sm text-gray-800 mr-2">4.6</span>
                                                <div class="flex text-yellow-400">
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-half-fill ri-xs"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">976</td>
                                    </tr>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4 text-sm text-gray-800">강원도 속초 설악산</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">8,765</td>
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <span class="text-sm text-gray-800 mr-2">4.5</span>
                                                <div class="flex text-yellow-400">
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-half-fill ri-xs"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">865</td>
                                    </tr>
                                    <tr class="hover:bg-gray-50">
                                        <td class="py-3 px-4 text-sm text-gray-800">경주 불국사</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">7,654</td>
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <span class="text-sm text-gray-800 mr-2">4.4</span>
                                                <div class="flex text-yellow-400">
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-fill ri-xs"></i>
                                                    <i class="ri-star-half-fill ri-xs"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">754</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 최근 활동 섹션 -->
                <div class="grid grid-cols-1 gap-6">
                    <div class="bg-white rounded shadow p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="text-gray-700 font-medium">최근 사용자 활동</h3>
                            <button class="text-primary text-sm font-medium flex items-center">
                                <span>전체보기</span>
                                <div class="w-4 h-4 flex items-center justify-center ml-1">
                                    <i class="ri-arrow-right-line"></i>
                                </div>
                            </button>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="min-w-full">
                                <thead>
                                    <tr class="border-b border-gray-200">
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">사용자</th>
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">활동</th>
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">위치</th>
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">시간</th>
                                        <th class="py-3 px-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center text-blue-600">
                                                    <span class="text-xs font-medium">김</span>
                                                </div>
                                                <div class="ml-3">
                                                    <p class="text-sm font-medium text-gray-800">김지민</p>
                                                    <p class="text-xs text-gray-500">user_jimin92</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">리뷰 작성</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">제주도 성산일출봉</td>
                                        <td class="py-3 px-4 text-sm text-gray-500">10분 전</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">완료</span>
                                        </td>
                                    </tr>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 bg-purple-100 rounded-full flex items-center justify-center text-purple-600">
                                                    <span class="text-xs font-medium">이</span>
                                                </div>
                                                <div class="ml-3">
                                                    <p class="text-sm font-medium text-gray-800">이서연</p>
                                                    <p class="text-xs text-gray-500">seoyeon_lee</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">회원가입</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">-</td>
                                        <td class="py-3 px-4 text-sm text-gray-500">25분 전</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-full">신규</span>
                                        </td>
                                    </tr>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 bg-yellow-100 rounded-full flex items-center justify-center text-yellow-600">
                                                    <span class="text-xs font-medium">박</span>
                                                </div>
                                                <div class="ml-3">
                                                    <p class="text-sm font-medium text-gray-800">박준호</p>
                                                    <p class="text-xs text-gray-500">junho_park</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">리뷰 신고</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">부산 해운대</td>
                                        <td class="py-3 px-4 text-sm text-gray-500">1시간 전</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs font-medium bg-red-100 text-red-800 rounded-full">요주의</span>
                                        </td>
                                    </tr>
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 bg-green-100 rounded-full flex items-center justify-center text-green-600">
                                                    <span class="text-xs font-medium">최</span>
                                                </div>
                                                <div class="ml-3">
                                                    <p class="text-sm font-medium text-gray-800">최다은</p>
                                                    <p class="text-xs text-gray-500">daeun_choi</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">여행 계획 생성</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">강원도 속초</td>
                                        <td class="py-3 px-4 text-sm text-gray-500">2시간 전</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">완료</span>
                                        </td>
                                    </tr>
                                    <tr class="hover:bg-gray-50">
                                        <td class="py-3 px-4">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 bg-red-100 rounded-full flex items-center justify-center text-red-600">
                                                    <span class="text-xs font-medium">정</span>
                                                </div>
                                                <div class="ml-3">
                                                    <p class="text-sm font-medium text-gray-800">정민우</p>
                                                    <p class="text-xs text-gray-500">minwoo_j</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-3 px-4 text-sm text-gray-800">계정 탈퇴</td>
                                        <td class="py-3 px-4 text-sm text-gray-800">-</td>
                                        <td class="py-3 px-4 text-sm text-gray-500">3시간 전</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs font-medium bg-gray-100 text-gray-800 rounded-full">탈퇴</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script type="text/javascript" crossorigin="anonymous" src="https://us-assets.i.posthog.com/array/phc_t9tkQZJiyi2ps9zUYm8TDsL6qXo4YmZx0Ot5rBlAlEd/config.js"></script><script type="text/javascript" crossorigin="anonymous" src="https://us-assets.i.posthog.com/static/dead-clicks-autocapture.js?v=1.240.6"></script><script>
        document.addEventListener('DOMContentLoaded', function() {
            // 방문자 추이 차트
            const visitorsChart = echarts.init(document.getElementById('visitors-chart'));
            const visitorsOption = {
                animation: false,
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: 'rgba(255, 255, 255, 0.9)',
                    borderColor: '#e5e7eb',
                    textStyle: {
                        color: '#1f2937'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    top: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['5/5', '5/6', '5/7', '5/8', '5/9', '5/10', '5/11', '5/12'],
                    axisLine: {
                        lineStyle: {
                            color: '#e5e7eb'
                        }
                    },
                    axisLabel: {
                        color: '#1f2937'
                    }
                },
                yAxis: {
                    type: 'value',
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    splitLine: {
                        lineStyle: {
                            color: '#f3f4f6'
                        }
                    },
                    axisLabel: {
                        color: '#1f2937'
                    }
                },
                series: [
                    {
                        name: '방문자 수',
                        type: 'line',
                        smooth: true,
                        symbol: 'none',
                        lineStyle: {
                            width: 3,
                            color: 'rgba(87, 181, 231, 1)'
                        },
                        areaStyle: {
                            color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [{
                                    offset: 0, color: 'rgba(87, 181, 231, 0.2)'
                                }, {
                                    offset: 1, color: 'rgba(87, 181, 231, 0.01)'
                                }]
                            }
                        },
                        data: [820, 932, 901, 934, 1290, 1330, 1320, 1450]
                    }
                ]
            };
            visitorsChart.setOption(visitorsOption);

            // 사용자 유형 분포 차트
            const userTypeChart = echarts.init(document.getElementById('user-type-chart'));
            const userTypeOption = {
                animation: false,
                tooltip: {
                    trigger: 'item',
                    backgroundColor: 'rgba(255, 255, 255, 0.9)',
                    borderColor: '#e5e7eb',
                    textStyle: {
                        color: '#1f2937'
                    }
                },
                legend: {
                    top: '0%',
                    left: 'center',
                    textStyle: {
                        color: '#1f2937'
                    }
                },
                series: [
                    {
                        name: '사용자 유형',
                        type: 'pie',
                        radius: ['40%', '70%'],
                        avoidLabelOverlap: false,
                        itemStyle: {
                            borderRadius: 8,
                            borderColor: '#fff',
                            borderWidth: 2
                        },
                        label: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            label: {
                                show: true,
                                fontSize: '14',
                                fontWeight: 'bold',
                                color: '#1f2937'
                            }
                        },
                        labelLine: {
                            show: false
                        },
                        data: [
                            { value: 45, name: '일반 여행자', itemStyle: { color: 'rgba(87, 181, 231, 1)' } },
                            { value: 25, name: '가족 여행자', itemStyle: { color: 'rgba(141, 211, 199, 1)' } },
                            { value: 15, name: '비즈니스 여행자', itemStyle: { color: 'rgba(251, 191, 114, 1)' } },
                            { value: 15, name: '배낭 여행자', itemStyle: { color: 'rgba(252, 141, 98, 1)' } }
                        ]
                    }
                ]
            };
            userTypeChart.setOption(userTypeOption);

            // 기능별 이용률 차트
            const featureUsageChart = echarts.init(document.getElementById('feature-usage-chart'));
            const featureUsageOption = {
                animation: false,
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: 'rgba(255, 255, 255, 0.9)',
                    borderColor: '#e5e7eb',
                    textStyle: {
                        color: '#1f2937'
                    },
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    top: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'value',
                    axisLine: {
                        lineStyle: {
                            color: '#e5e7eb'
                        }
                    },
                    axisLabel: {
                        color: '#1f2937'
                    },
                    splitLine: {
                        lineStyle: {
                            color: '#f3f4f6'
                        }
                    }
                },
                yAxis: {
                    type: 'category',
                    data: ['여행 계획', '리뷰 작성', '장소 검색', '지도 보기', '여행 일기'],
                    axisLine: {
                        lineStyle: {
                            color: '#e5e7eb'
                        }
                    },
                    axisLabel: {
                        color: '#1f2937'
                    }
                },
                series: [
                    {
                        name: '이용률',
                        type: 'bar',
                        barWidth: '60%',
                        data: [
                            { value: 78, itemStyle: { color: 'rgba(87, 181, 231, 1)' } },
                            { value: 65, itemStyle: { color: 'rgba(141, 211, 199, 1)' } },
                            { value: 83, itemStyle: { color: 'rgba(251, 191, 114, 1)' } },
                            { value: 92, itemStyle: { color: 'rgba(252, 141, 98, 1)' } },
                            { value: 42, itemStyle: { color: 'rgba(87, 181, 231, 0.7)' } }
                        ],
                        itemStyle: {
                            borderRadius: [0, 4, 4, 0]
                        }
                    }
                ]
            };
            featureUsageChart.setOption(featureUsageOption);

            // 반응형 차트 조정
            window.addEventListener('resize', function() {
                visitorsChart.resize();
                userTypeChart.resize();
                featureUsageChart.resize();
            });
        });
    </script>
<script>
    !function (t, e) { var o, n, p, r; e.__SV || (window.posthog = e, e._i = [], e.init = function (i, s, a) { function g(t, e) { var o = e.split("."); 2 == o.length && (t = t[o[0]], e = o[1]), t[e] = function () { t.push([e].concat(Array.prototype.slice.call(arguments, 0))) } } (p = t.createElement("script")).type = "text/javascript", p.crossOrigin = "anonymous", p.async = !0, p.src = s.api_host.replace(".i.posthog.com", "-assets.i.posthog.com") + "/static/array.js", (r = t.getElementsByTagName("script")[0]).parentNode.insertBefore(p, r); var u = e; for (void 0 !== a ? u = e[a] = [] : a = "posthog", u.people = u.people || [], u.toString = function (t) { var e = "posthog"; return "posthog" !== a && (e += "." + a), t || (e += " (stub)"), e }, u.people.toString = function () { return u.toString(1) + ".people (stub)" }, o = "init capture register register_once register_for_session unregister unregister_for_session getFeatureFlag getFeatureFlagPayload isFeatureEnabled reloadFeatureFlags updateEarlyAccessFeatureEnrollment getEarlyAccessFeatures on onFeatureFlags onSessionId getSurveys getActiveMatchingSurveys renderSurvey canRenderSurvey getNextSurveyStep identify setPersonProperties group resetGroups setPersonPropertiesForFlags resetPersonPropertiesForFlags setGroupPropertiesForFlags resetGroupPropertiesForFlags reset get_distinct_id getGroups get_session_id get_session_replay_url alias set_config startSessionRecording stopSessionRecording sessionRecordingStarted captureException loadToolbar get_property getSessionProperty createPersonProfile opt_in_capturing opt_out_capturing has_opted_in_capturing has_opted_out_capturing clear_opt_in_out_capturing debug".split(" "), n = 0; n < o.length; n++)g(u, o[n]); e._i.push([i, s, a]) }, e.__SV = 1) }(document, window.posthog || []);
    posthog.init('phc_t9tkQZJiyi2ps9zUYm8TDsL6qXo4YmZx0Ot5rBlAlEd', {
        api_host: 'https://us.i.posthog.com',
        autocapture: false,
        capture_pageview: false,
        capture_pageleave: false,
        capture_performance: {
            web_vitals: false,
        },
        rageclick: false,
    })
    window.shareKey = 'Gf2E2XESbjRgTaYFtGKtJA';
    window.host = 'readdy.ai';
</script>
<script src="https://static.readdy.ai/static/share.js"></script>

<div id="watermark" class="group" style="position: fixed; bottom: 48px; right: 46px; width: 184px; height: 39px; background-color: rgb(240, 240, 240); border-style: solid; border-width: 3px; border-radius: 12px; border-image-slice: 3; border-image-width: 3px; border-image-outset: 0; border-color: rgb(229, 231, 235); display: flex; align-items: center; justify-content: center; cursor: pointer;"><div class="designed-by" style="color: rgb(93, 93, 93); font-family: &quot;Secular One&quot;; font-size: 12px; line-height: 20px; font-weight: 400; padding-left: 12px;">Designed by</div><img src="https://public.readdy.ai/gen_page/watermark.png" style="width: 86px; margin-left: 0px;"></div></body>
</html>