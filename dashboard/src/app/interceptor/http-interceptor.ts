import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpHandler, HttpResponse, HttpRequest, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class AppHttpInterceptor implements HttpInterceptor {
   constructor() {}
   intercept( request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    // action interceptor
    const interceptReq = request.clone({
        headers: request.headers
        .set('Content-Type', 'application/json')
        .set("Access-Control-Allow-Origin", "*")
    })
    return next.handle(interceptReq);
   }
}