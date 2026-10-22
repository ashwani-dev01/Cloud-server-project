

echo "===== SERVER HEALTH ====="

if systemctl is-active --quiet nginx; then
    echo "Nginx       : RUNNING"
else
    echo "Nginx       : DOWN"
fi

if ss -ltn | grep -q ':80 '; then
    echo "Port 80     : OPEN"
else
    echo "Port 80     : CLOSED"
fi

echo "Disk Usage  : $(df -h / | awk 'NR==2 {print $5}')"
echo "Memory      : $(free -h | awk 'NR==2 {print $3 "/" $2}')"

echo "========================"
echo "$(date) - Health check completed" >> ~/cloud-server-project/health.log
