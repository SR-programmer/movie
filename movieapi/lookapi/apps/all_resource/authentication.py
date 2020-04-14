from rest_framework_jwt.authentication import JSONWebTokenAuthentication
import jwt


class MyJSONWebTokenAuthentication(JSONWebTokenAuthentication):
    def authenticate(self, request):
        """
        Returns a two-tuple of `User` and token if a valid signature has been
        supplied using JWT-based authentication.  Otherwise returns `None`.
        """

        jwt_value = self.get_jwt_value(request)
        if jwt_value is None:
            return None

        try:
            payload = self.jwt_decode_token(jwt_value)
        except jwt.ExpiredSignature:
            payload = None
        except jwt.DecodeError:
            payload = None

        if payload is not None:
            user = self.authenticate_credentials(payload)
        else:
            user = None

        return user, jwt_value




