import { Observable } from '../../Observable';
import { buffer } from '../../operator/buffer';
Observable.prototype.buffer = buffer;
