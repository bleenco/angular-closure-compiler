import { Observable } from '../../Observable';
import { publishBehavior } from '../../operator/publishBehavior';
Observable.prototype.publishBehavior = publishBehavior;
