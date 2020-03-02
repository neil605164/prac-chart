{{/* 定義各環境的 image repo + tag version */}}
{{- define "repo" -}}
  {{ $env := required "env required" .Values.env }}

  {{- if and .Values.dev (eq $env "develop") -}}
    {{- printf "%s%s:%s" .Values.dev.imageRepo .Values.dev.image .Values.dev.tag }}
  {{- end -}}

  {{- if and .Values.qa (eq $env "qatest") -}}
    {{- printf "%s%s:%s" .Values.qa.imageRepo .Values.qa.image .Values.qa.tag }}
  {{- end -}}

{{- end -}}

{{/* 定義各環境的 ingress host */}}
{{- define "ingressHost" -}}
  {{ $env := required "env required" .Values.env }}

  {{- if and .Values.dev (eq $env "develop") -}}
    {{- .Values.dev.ingressHost }}
  {{- end -}}

  {{- if and .Values.qa (eq $env "qatest") -}}
    {{- .Values.qa.ingressHost }}
  {{- end -}}

{{- end -}}

{{/* 定義各環境的 ingress Swagger path */}}
{{- define "ingressPath" -}}
  {{ $env := required "env required" .Values.env }}

  {{- if and .Values.dev (eq $env "develop") -}}
    {{- .Values.dev.ingressPath }}
  {{- end -}}

  {{- if and .Values.dev (eq $env "qatest") -}}
    {{- .Values.dev.ingressPath }}
  {{- end -}}

{{- end -}}

{{/* 定義各環境服務名稱 */}}
{{- define "chartName" -}}
  {{ $env := required "env required" .Values.env }}

  {{- if and .Values.dev (eq $env "develop") -}}
    {{ printf "dev-%s" .Chart.Name }}
  {{- end -}}

  {{- if and .Values.qa (eq $env "qatest") -}}
    {{ printf "qa-%s" .Chart.Name -}}
  {{- end -}}

{{- end -}}

{{/* 定義 golang 環境變數 */}}
{{- define "golangEnv" -}}
  {{ $env := required "env required" .Values.env }}

  {{- if and .Values.dev (eq $env "develop") -}}
    {{ printf "%s-k8s" .Values.env }}
  {{- end -}}

  {{- if and .Values.qa (eq $env "qatest") -}}
    {{ printf "%s-k8s" .Values.env }}
  {{- end -}}

{{- end -}}