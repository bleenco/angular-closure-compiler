import { Observable } from '../../Observable';
import { timeoutWith } from '../../operator/timeoutWith';
Observable.prototype.timeoutWith = timeoutWith;
