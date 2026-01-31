package ZoneMinder::Control::TenvisJPT3815W;

use strict;
use warnings;
use ZoneMinder::Logger qw(:all);
use ZoneMinder::Control;
use LWP::UserAgent;

use parent qw(ZoneMinder::Control);

# ==========================================================
# SEND COMMAND TO CAMERA
# ==========================================================

sub sendCmd {
    my ($self, $cmd) = @_;

    my $base = "http://" . $self->{Monitor}->{ControlAddress}
             . "/web/cgi-bin/hi3510/ptzctrl.cgi";

    my $url = $base . "?-step=0&-act=$cmd";

    Debug("URL=$url");

    my $ua = LWP::UserAgent->new;
    $ua->timeout(2);

    # ======================================================
    # PUT YOUR OWN BASE64 AUTH STRING HERE
    # Example: echo -n "user:password" | base64
    # ======================================================
    $ua->default_header(
        'Authorization' => 'Basic PUT_YOUR_BASE64_HERE'
    );

    my $res = $ua->get($url);

    if (!$res->is_success) {
        Error("Tenvis: HTTP error " . $res->status_line);
        return 0;
    }

    return 1;
}

# ==========================================================
# MOVEMENTS
# ==========================================================

sub moveConUp    { shift->sendCmd("up"); }
sub moveConDown  { shift->sendCmd("down"); }
sub moveConLeft  { shift->sendCmd("left"); }
sub moveConRight { shift->sendCmd("right"); }

sub moveStop     { shift->sendCmd("stop"); }

1;
